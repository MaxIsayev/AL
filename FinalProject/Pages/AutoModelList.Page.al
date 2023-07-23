page 50132 "Auto Model List"
{
    Caption = 'Auto Model List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Model";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Auto Mark Code"; Rec."Auto Mark Code")
                {
                    ToolTip = 'Auto Mark Code';
                }
                field("Auto Model Code"; Rec."Auto Model Code")
                {
                    ToolTip = 'Auto Model Code';
                }
                field("Auto Model Description"; Rec."Auto Model Description")
                {
                    ToolTip = 'Auto Model Description';
                }

            }
        }
    }
}