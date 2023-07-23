table 50139 "Finished Auto Rent Header"
{
    Caption = 'Finished Auto Rent Header';
    DataClassification = CustomerContent;
    DataPerCompany = false;

    fields
    {
        field(1; "Number"; Code[20]) { }

        field(2; "Customer Number"; Code[20]) { }

        field(3; "Driver License"; MediaSet) { }

        field(4; "Auto Rent Date"; Date) { }

        field(5; "Car Number"; Code[20]) { }

        field(6; "Date Time Reserved From"; DateTime) { }

        field(7; "Date Time Reserved Until"; DateTime) { }

        field(8; "Reservation Sum"; Decimal) { }
    }
    keys
    {
        key(PK; "Number") { Clustered = true; }
        key(key2; "Date Time Reserved From", "Date Time Reserved Until") { }
    }

}
