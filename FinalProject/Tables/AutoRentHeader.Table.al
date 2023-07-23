table 50136 "Auto Rent Header"
{
    Caption = 'Auto Rent Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Number"; Code[20]) { }

        field(2; "Customer Number"; Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate()
            var
                CheckCustomer: Record "Cust. Ledger Entry";
                Customer: Record Customer;
                CustomerHasDebts: Label 'Customer has debts!';
            begin
                //We check if customer has debts
                CheckCustomer.SetAutoCalcFields("Amount (LCY)");
                if CheckCustomer.Get(Rec."Customer Number") then
                    if CheckCustomer."Amount (LCY)" > 0 then
                        Error(CustomerHasDebts);
                //Check if customer is blocked
                if Customer.Get(Rec."Customer Number") then
                    Customer.TestField(Blocked, Customer.Blocked::" ");
            end;
        }

        field(3; "Driver License"; MediaSet) { }

        field(4; "Auto Rent Date"; Date) { }

        field(5; "Car Number"; Code[20]) { }

        field(6; "Date Time Reserved From"; DateTime)
        {
            trigger OnValidate()
            var
                AutoReservation: Record "Auto Reservation";
                NumberOfMatches: Integer;
                NoMatchesForCarReservation: Label 'No Match for Car Reservation Date Time From (from Auto Reservation table)!';
            begin
                //Check if there are matching 'date reserved from' from auto reservations for this car
                AutoReservation.Reset();
                AutoReservation.SetFilter("Car Number", Rec."Car Number");
                NumberOfMatches := 0;
                if AutoReservation.FindSet() then
                    repeat
                        if AutoReservation."Reserved Date Time From" = Rec."Date Time Reserved From" then
                            NumberOfMatches += 1;
                    until AutoReservation.Next() = 0;
                if NumberOfMatches = 0 then
                    Error(NoMatchesForCarReservation);
            end;
        }

        field(7; "Date Time Reserved Until"; DateTime)
        {
            trigger OnValidate()
            var
                AutoReservation: Record "Auto Reservation";
                NumberOfMatches: Integer;
                NoMatchesForCarReservation: Label 'No Match for Car Reservation Date Time Until (from Auto Reservation table)!';
            begin
                //Check if there are matching 'date reserved from' from auto reservations for this car
                AutoReservation.Reset();
                AutoReservation.SetFilter("Car Number", Rec."Car Number");
                NumberOfMatches := 0;
                if AutoReservation.FindSet() then
                    repeat
                        if AutoReservation."Reserved Date Time Until" = Rec."Date Time Reserved Until" then
                            NumberOfMatches += 1;
                    until AutoReservation.Next() = 0;
                if NumberOfMatches = 0 then
                    Error(NoMatchesForCarReservation);
            end;
        }

        field(8; "Reservation Sum"; Decimal)
        {
            Caption = 'Reservation Sum';
        }

        field(9; "Total Sum"; Decimal)
        {
            Caption = 'Total Reservation Sum';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula =
                sum("Auto Rent Header"."Reservation Sum");
        }

        field(10; "Rent Status"; Enum "Auto Rent Status")
        {
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Number") { Clustered = true; }
    }

    trigger OnInsert()
    var
        AutoSetup: Record "Auto Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        //Number is assigned from number serie (autosetup)
        if "Number" = '' then begin
            //AutoSetup.Get() may not work because of some bugs in auto setup (empty or duplicate record created)
            if not AutoSetup.Get() then
                AutoSetup.FindLast();
            AutoSetup.TestField("Auto Number Serie");
            "Number" := NoSeriesManagement.GetNextNo(AutoSetup."Auto Number Serie", WorkDate(), true);
        end;
        //Default Auto Rent Status    
        "Rent Status" := Rec."Rent Status"::Open;
    end;
}
