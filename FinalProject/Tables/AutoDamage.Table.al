table 50135 "Auto Damage"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Car Number"; Code[20]) { }

        field(2; "Line Number"; Integer) { }

        field(3; "Damage Date"; Date) { }

        field(4; "Description"; Text[2000]) { }

        field(5; "Status"; Enum "Auto Damage Status") { }
    }
    keys
    {
        key(Key1; "Car Number", "Line Number") { Clustered = true; }
    }
}
