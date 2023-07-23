table 50134 "Auto Reservation"
{
    fields
    {
        field(1; "Car Number"; Code[20]) { }

        field(2; "Line Number"; Code[20]) { }

        field(3; "Customer Number"; Code[20])
        {
            TableRelation = Customer;
        }

        field(4; "Reserved Date Time From"; DateTime)
        {
            trigger OnValidate()
            var
                BadDateErr: Label 'Date From cannot be later than Date Until';
                PeriodsOverlap: Label 'Overlapping periods for the same car';
            begin

                if (Rec."Reserved Date Time From" <> 0DT) and (Rec."Reserved Date Time Until" <> 0DT) then
                    if (Rec."Reserved Date Time From" > Rec."Reserved Date Time Until") then
                        Error(BadDateErr)
                    else
                        if CheckIfPeriodsOverlaps() then
                            Error(PeriodsOverlap);
            end;
        }

        field(5; "Reserved Date Time Until"; DateTime)
        {
            trigger OnValidate()
            var
                BadDateErr: Label 'Date From cannot be later than Date Until';
                PeriodsOverlap: Label 'Overlapping periods for the same car';
            begin
                if (Rec."Reserved Date Time From" <> 0DT) and (Rec."Reserved Date Time Until" <> 0DT) then
                    if (Rec."Reserved Date Time From" > Rec."Reserved Date Time Until") then
                        Error(BadDateErr)
                    else
                        if CheckIfPeriodsOverlaps() then
                            Error(PeriodsOverlap);
            end;
        }
    }
    keys
    {
        key(Key1; "Car Number", "Line Number") { Clustered = true; }
    }

    local procedure CheckIfPeriodsOverlaps() result: Boolean
    var
        AutoReservation: Record "Auto Reservation";
        NumberOfOverlaps: Integer;
    begin
        result := false;
        NumberOfOverlaps := 0;
        AutoReservation.Reset();
        AutoReservation.SetFilter("Car Number", Rec."Car Number");
        if AutoReservation.FindSet() then
            repeat
                //NOT overlapping periods:
                //                        [  Reservation 1   ]
                //[   Reservation 2   ]
                //                                              [   Reservation 3   ]               
                if not (((Rec."Reserved Date Time From" < AutoReservation."Reserved Date Time From") and
                            (Rec."Reserved Date Time Until" < AutoReservation."Reserved Date Time From")) or
                        ((Rec."Reserved Date Time From" > AutoReservation."Reserved Date Time Until") and
                            (Rec."Reserved Date Time Until" > AutoReservation."Reserved Date Time Until")))
                then begin
                    NumberOfOverlaps += 1;
                    //THIS because NumberOfOverlaps counts entered period
                    if NumberOfOverlaps > 1 then begin
                        result := true;
                        break;
                    end;
                end;
            until AutoReservation.Next() = 0;
    end;
}
