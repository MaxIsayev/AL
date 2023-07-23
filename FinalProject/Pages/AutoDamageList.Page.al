page 50137 "Auto Damage List"
{
    ApplicationArea = All;
    Caption = 'Auto Damage List';
    PageType = List;
    SourceTable = "Auto Damage";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Car Number"; Rec."Car Number")
                {
                    ToolTip = 'Car Number';
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
                field("Status"; Rec."Status")
                {
                    ToolTip = 'Status';
                }
            }
        }
    }
}
