table 50132 "Auto Model"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Auto Mark Code"; Code[20]) { }

        field(2; "Auto Model Code"; Code[20]) { }
        field(3; "Auto Model Description"; Text[2000]) { }
    }

    keys
    {
        key(Key1; "Auto Mark Code", "Auto Model Code") { Clustered = true; }
    }

}