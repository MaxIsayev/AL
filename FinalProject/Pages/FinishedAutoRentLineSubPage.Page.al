page 50146 "Finished Auto Rent LineSubPage"
{
    Caption = 'Finished Auto Rent Line SubPage';

    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Finished Auto Rent Line";
    UsageCategory = None;

    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = true;
    MultipleNewLines = true;
    Editable = false;

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
}
