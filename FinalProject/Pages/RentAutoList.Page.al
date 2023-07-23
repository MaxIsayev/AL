page 50141 "Rent Auto List"
{
    ApplicationArea = All;
    Caption = 'Rent Auto List';
    PageType = List;
    SourceTable = "Auto Rent Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Number"; Rec."Number")
                {
                    ToolTip = 'Auto Serie Number';
                    Editable = (Rec."Rent Status" = Rec."Rent Status"::Open);
                }
                field("Customer Number"; Rec."Customer Number")
                {
                    ToolTip = 'Customer Number';
                    Editable = (Rec."Rent Status" = Rec."Rent Status"::Open);
                }
                field("Driver License"; Rec."Driver License")
                {
                    ToolTip = 'Driver License';
                    Editable = (Rec."Rent Status" = Rec."Rent Status"::Open);
                }
                field("Auto Rent Date"; Rec."Auto Rent Date")
                {
                    ToolTip = 'Auto Rent Date';
                    Editable = (Rec."Rent Status" = Rec."Rent Status"::Open);
                }
                field("Car Number"; Rec."Car Number")
                {
                    ToolTip = 'Car Number';
                    Editable = (Rec."Rent Status" = Rec."Rent Status"::Open);
                }
                field("Date Reserved From"; Rec."Date Time Reserved From")
                {
                    ToolTip = 'Date Reserved From';
                    Editable = (Rec."Rent Status" = Rec."Rent Status"::Open);
                }
                field("Date Reserved Until"; Rec."Date Time Reserved Until")
                {
                    ToolTip = 'Date Reserved Until';
                    Editable = (Rec."Rent Status" = Rec."Rent Status"::Open);
                }
                field("Reservation Sum"; Rec."Reservation Sum")
                {
                    ToolTip = 'Reservation Sum';
                    Editable = (Rec."Rent Status" = Rec."Rent Status"::Open);
                }
                field("Total Sum"; Rec."Total Sum")
                {
                    ToolTip = 'Total Sum';
                }
                field("Rent Status"; Rec."Rent Status")
                {
                    ToolTip = 'Rent Status';
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        DisplayMessage: Label 'Opening Autos with Rent Status';
        AutoRentHeader: Record "Auto Rent Header";
    begin
        Message(DisplayMessage);
        AutoRentHeader.Reset();
        //setting filter by auto status (first and last value)
        AutoRentHeader.SetRange("Rent Status", Rec."Rent Status"::Rent, Rec."Rent Status"::Rent);
        SetTableView(AutoRentHeader);
    end;
}
