table 50138 "Auto Rent Damage"
{
    Caption = 'Auto Rent Damage';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Number"; Code[20]) { }

        field(2; "Line Number"; Integer) { }

        field(3; "Damage Date"; Date) { }

        field(4; "Description"; Text[2000]) { }

    }
    keys
    {
        key(Key1; "Document Number", "Line Number") { Clustered = true; }
    }
}
