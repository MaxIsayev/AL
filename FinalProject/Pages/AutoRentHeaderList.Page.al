page 50138 "Auto Rent Header List"
{
    ApplicationArea = All;
    Caption = 'Auto Rent Header List';
    PageType = List;
    SourceTable = "Auto Rent Header";
    UsageCategory = Lists;
    CardPageId = "Auto Rent Header Card";

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
                    ToolTip = 'Date Time Reserved From';
                    Editable = (Rec."Rent Status" = Rec."Rent Status"::Open);
                }
                field("Date Reserved Until"; Rec."Date Time Reserved Until")
                {
                    ToolTip = 'Date Time Reserved Until';
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

        area(factboxes)
        {
            part(ItemPicture; "Item Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ChangeRentStatusToRent)
            {
                Caption = 'Change Rent Status To Rent';
                ToolTip = 'Change Rent Status To Rent';

                trigger OnAction()
                begin
                    Rec."Rent Status" := Rec."Rent Status"::Rent;
                    Rec.Modify();
                end;
            }

            action(ReturnCar)
            {
                Caption = 'Return Car';
                ToolTip = 'Return Car';

                trigger OnAction()
                var
                    CarReturn: Codeunit "Return Car";
                begin
                    CarReturn.ReturnCar(Rec."Car Number", Rec."Number");
                end;
            }

            action(ImportPicture)
            {
                Caption = 'Import Picture';
                ToolTip = 'Import Picture';
                Image = Import;

                trigger OnAction()
                var
                    PictureURLDialog: Page "Picture URL Dialog";
                    Description: Label 'Driver License';
                begin
                    PictureURLDialog.SetItemInfo(Rec."Number", Description);
                    if PictureURLDialog.RunModal() = Action::OK then
                        PictureURLDialog.ImportItemPictureFromURL(Rec);
                end;
            }

            action(DeletePicture)
            {
                Caption = 'Delete Picture from Selected Record';
                ToolTip = 'Delete Picture from Selected Record';

                trigger OnAction()
                begin
                    Clear(Rec."Driver License");
                    Rec.Modify();
                end;
            }
        }
    }

}
