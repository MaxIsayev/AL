table 50140 "Finished Auto Rent Line"
{
    Caption = 'Finished Auto Rent Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Number"; Code[20]) { }

        field(2; "Line Number"; Integer) { }

        field(3; "Line Type"; Enum "Auto Rent Line Type") { }

        field(4; "Number"; code[20]) { }

        field(5; "Description"; Text[100]) { }

        field(6; "Quantity"; Integer) { }

        field(7; "Unit Price"; Decimal) { }

        field(8; "Line Sum"; Decimal) { }
    }

    keys
    {
        key(Key1; "Document Number", "Line Number") { Clustered = true; }
    }
}
