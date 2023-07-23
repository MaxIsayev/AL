page 50143 "Auto Rent Damage List"
{
    ApplicationArea = All;
    Caption = 'Auto Rent Damage List';
    PageType = List;
    SourceTable = "Auto Rent Damage";
    UsageCategory = Lists;

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
                field("Damage Date"; Rec."Damage Date")
                {
                    ToolTip = 'Date';
                }
                field("Description"; Rec."Description")
                {
                    ToolTip = 'Description';
                }
            }
        }
    }
}
