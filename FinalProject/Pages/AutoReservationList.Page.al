page 50135 "Auto Reservation List"
{
    ApplicationArea = All;
    Caption = 'Auto Reservations';
    PageType = List;
    SourceTable = "Auto Reservation";
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
                field("Customer Number"; Rec."Customer Number")
                {
                    ToolTip = 'Customer Number';
                }
                field("Reserved Date Time From"; Rec."Reserved Date Time From")
                {
                    ToolTip = 'Reserved Date Time From';
                }
                field("Reserved Date Time Until"; Rec."Reserved Date Time Until")
                {
                    ToolTip = 'Reserved Date Time Until';
                }
            }
        }
    }
}
