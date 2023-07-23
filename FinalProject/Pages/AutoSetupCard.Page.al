page 50130 "Auto Setup Card"
{   //It impossible to avoid text constants in caption and tooltip property
    Caption = 'Auto Setup';
    PageType = Card;
    UsageCategory = Administration;
    ApplicationArea = All;
    SourceTable = "Auto Setup";

    layout
    {
        area(Content)
        {
            field("Auto Number Serie"; Rec."Auto Number Serie")
            {
                ToolTip = 'Auto Number Serie';
            }
            field("Rent Card Serie"; Rec."Rent Card Serie")
            {
                ToolTip = 'Rent Card Serie';
            }
            field("Attachments Location"; Rec."Attachments Location")
            {
                ToolTip = 'Attachments Location';
            }
        }
    }
}