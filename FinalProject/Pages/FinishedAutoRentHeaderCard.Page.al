page 50145 "Finished Auto Rent Header Card"
{
    ApplicationArea = All;
    Caption = 'Finished Auto Rent Header Card';
    PageType = Card;
    SourceTable = "Finished Auto Rent Header";
    UsageCategory = None;
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Number"; Rec."Number")
                {
                    ToolTip = 'Auto Serie Number';
                }
                field("Customer Number"; Rec."Customer Number")
                {
                    ToolTip = 'Customer Number';
                }
                field("Driver License"; Rec."Driver License")
                {
                    ToolTip = 'Driver License';
                }
                field("Auto Rent Date"; Rec."Auto Rent Date")
                {
                    ToolTip = 'Auto Rent Date';
                }
                field("Car Number"; Rec."Car Number")
                {
                    ToolTip = 'Car Number';
                }
                field("Date Time Reserved From"; Rec."Date Time Reserved From")
                {
                    ToolTip = 'Date Time Reserved From';
                }
                field("Date Time Reserved Until"; Rec."Date Time Reserved Until")
                {
                    ToolTip = 'Date Time Reserved Until';
                }
                field("Reservation Sum"; Rec."Reservation Sum")
                {
                    ToolTip = 'Reservation Sum';
                }

            }

            part(Lines; "Finished Auto Rent LineSubPage")
            {
                Editable = false;
            }
        }

        area(factboxes)
        {
            part(ItemPicture; "Item Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
            }
        }
    }
}
