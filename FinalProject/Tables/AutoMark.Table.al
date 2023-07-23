table 50131 "Auto Mark"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Auto Mark Code"; Code[20]) { }
        field(2; "Auto Mark Description"; Text[2000]) { }
    }

    keys
    {
        key(Key1; "Auto Mark Code")
        {
            Clustered = true;
        }
    }
}