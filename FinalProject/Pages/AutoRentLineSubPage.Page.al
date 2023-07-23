page 50142 "Auto Rent Line SubPage"
{
    Caption = 'Lines';

    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Auto Rent Line";

    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = true;
    MultipleNewLines = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Number"; Rec."Document Number")
                {
                    ToolTip = 'Document Number';

                }
                field("Line Number"; Rec."Line Number")
                {
                    ToolTip = 'Line Number';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ToolTip = 'Line Type';
                }
                field("Number"; Rec."Number")
                {
                    ToolTip = 'Number';
                }
                field("Description"; Rec."Description")
                {
                    ToolTip = 'Description';
                }
                field("Quantity"; Rec."Quantity")
                {
                    ToolTip = 'Quantity';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Unit Price';
                }
                field("Line Sum"; Rec."Line Sum")
                {
                    ToolTip = 'Line Sum';
                }
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    var
        FirstRecordCannotBeDeleted: Label 'First record of list part cannot be deleted!';
        RecordToCompare: Record "Auto Rent Line";
    begin
        if (Rec.Count = 1) and (Rec."Line Type" = Rec."Line Type"::Resource) then
            Error(FirstRecordCannotBeDeleted)
        else begin
            RecordToCompare.FindFirst();
            if (RecordToCompare."Document Number" = Rec."Document Number") and (RecordToCompare."Line Number" = Rec."Line Number") and
                (Rec."Line Type" = RecordToCompare."Line Type") and (Rec."Line Type" = Rec."Line Type"::Resource) then
                Error(FirstRecordCannotBeDeleted);
        end;

    end;
}
