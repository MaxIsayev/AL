table 50137 "Auto Rent Line"
{
    Caption = 'Auto Rent Line';
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; "Document Number"; Code[20]) { }

        field(2; "Line Number"; Integer) { }

        field(3; "Line Type"; Enum "Auto Rent Line Type") { }

        field(4; "Number"; code[20])
        {
            TableRelation =
            if ("Line Type" = const(Item)) Item else
            if ("Line Type" = const(Resource)) Resource;

            trigger OnValidate()
            var
                ItemRecord: Record Item;
                ResourceRecord: Record Resource;
            begin
                //if we choose item or resource number - some other info (description, price...) is set automatically
                if "Line Type" = "Line Type"::Item then begin
                    ItemRecord.Get(Rec."Number");
                    "Description" := ItemRecord.Description;
                    "Unit Price" := ItemRecord."Unit Price";
                    "Line Sum" := Round("Quantity" * "Unit Price");
                end
                else
                    if "Line Type" = "Line Type"::Resource then begin
                        ResourceRecord.Get(Rec."Number");
                        "Description" := ResourceRecord.Name;
                        "Unit Price" := ResourceRecord."Unit Price";
                        "Line Sum" := Round("Quantity" * "Unit Price");
                    end;
            end;
        }

        field(5; "Description"; Text[100]) { }

        field(6; "Quantity"; Integer)
        {
            trigger OnValidate()
            begin
                "Line Sum" := Round("Quantity" * "Unit Price");
            end;
        }

        field(7; "Unit Price"; Decimal)
        {
            trigger OnValidate()
            begin
                "Line Sum" := Round("Quantity" * "Unit Price");
            end;
        }

        field(8; "Line Sum"; Decimal) { }
    }

    keys
    {
        key(Key1; "Document Number", "Line Number") { Clustered = true; }
    }
}
