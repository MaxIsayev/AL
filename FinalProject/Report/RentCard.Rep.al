report 50130 "Rent Card"
{
    Caption = 'Rent Card';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {

        dataitem("Auto Rent Header"; "Auto Rent Header")
        {
            PrintOnlyIfDetail = true;

            column(Car_Number; "Car Number") { }
            column(Date_Reserved_From; "Date Time Reserved From") { }
            column(Date_Reserved_Until; "Date Time Reserved Until") { }

            dataitem("Auto"; "Auto")
            {
                PrintOnlyIfDetail = true;
                DataItemLink = "Number" = FIELD("Car Number");
                DataItemLinkReference = "Auto Rent Header";
                column(Mark; "Mark") { }
                column(Model; "Model") { }

                dataitem(Customer; Customer)
                {
                    PrintOnlyIfDetail = true;
                    DataItemLink = "No." = FIELD("Customer Number");
                    DataItemLinkReference = "Auto Rent Header";
                    column(Name; Name) { }

                    dataitem("Auto Rent Line"; "Auto Rent Line")
                    {
                        DataItemTableView = sorting("Document Number", "Line Number");

                        column(Description; Description) { }
                        column(Quantity; Quantity) { }
                        column(Unit_Price; "Unit Price") { }
                        column(Line_Sum; "Line Sum") { }
                    }
                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Layout/Rent Card.rdl';
        }
    }
}
