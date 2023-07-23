page 50136 "Valid Reservation List"
{
    ApplicationArea = All;
    Caption = 'Valid Reservations';
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

    trigger OnOpenPage()
    var
        DisplayMessage: Label 'Opening future reservations';
        AutoReservationHeader: Record "Auto Reservation";
    begin
        Message(DisplayMessage);
        AutoReservationHeader.Reset();
        //SetRange works better if full period is set
        AutoReservationHeader.SetRange("Reserved Date Time From", CurrentDateTime, CreateDateTime(21000101D, 000000T));
        SetTableView(AutoReservationHeader);
    end;
}
