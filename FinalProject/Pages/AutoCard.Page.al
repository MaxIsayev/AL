page 50134 "Auto Card"
{
    ApplicationArea = All;
    Caption = 'Auto Card';
    PageType = Card;
    UsageCategory = None;
    SourceTable = Auto;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Number"; Rec."Number")
                {
                    ToolTip = 'Auto Number';
                }
                field("Name"; Rec."Name")
                {
                    ToolTip = 'Auto Name';
                }
                field("Mark"; Rec."Mark")
                {
                    ToolTip = 'Auto Mark';
                }
                field("Model"; Rec."Model")
                {
                    ToolTip = 'Auto Model';
                }
                field("Production Year"; Rec."Production Year")
                {
                    ToolTip = 'Auto Production Year';
                }
                field("Civil Insurance Validity Until"; Rec."Civil Insurance Validity Until")
                {
                    ToolTip = 'Civil Insurance Validity Until';
                }
                field("TI Validity Until"; Rec."TI Validity Until")
                {
                    ToolTip = 'Technical Inspection Validity Until';
                }
                field("Place Code"; Rec."Place Code")
                {
                    ToolTip = 'Auto Place Code';
                }
                field("Rent Service"; Rec."Rent Service")
                {
                    ToolTip = 'Auto Rent Service';
                }
                field("Rent Price"; Rec."Rent Price")
                {
                    ToolTip = 'Auto Rent Price';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenAutoReservationsList)
            {
                Caption = 'Auto Reservations';
                ToolTip = 'Auto Reservations';

                trigger OnAction()
                var
                    AutoReservationsList: Page "Auto Reservation List";
                begin
                    AutoReservationsList.Run;
                end;
            }

            action(PrintReport)
            {
                Caption = 'Print';
                ToolTip = 'Print';

                trigger OnAction()
                var
                    AutoRecord: Record "Auto";
                begin
                    AutoRecord := Rec;
                    AutoRecord.SetRecFilter();
                    Report.RunModal(Report::"Rent History", true, false, AutoRecord);
                end;
            }
        }
    }
}
