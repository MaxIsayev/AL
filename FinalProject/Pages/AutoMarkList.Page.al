page 50131 "Auto Mark List"
{
    Caption = 'Auto Mark List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Mark";

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
                field("Auto Mark Description"; Rec."Auto Mark Description")
                {
                    ToolTip = 'Auto Mark Description';
                }
            }
        }
    }
}