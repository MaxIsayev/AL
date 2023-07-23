report 50131 "Rent History"
{
    ApplicationArea = All;
    Caption = 'Rent History';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Auto"; "Auto")
        {
            PrintOnlyIfDetail = true;

            column(Number; "Number") { }
            column(Mark; "Mark") { }
            column(Model; "Model") { }

            dataitem("Finished Auto Rent Header"; "Finished Auto Rent Header")
            {
                PrintOnlyIfDetail = true;
                DataItemLink = "Car Number" = FIELD("Number");
                DataItemLinkReference = "Auto";

                DataItemTableView = sorting("Date Time Reserved From", "Date Time Reserved Until");

                column(Date_Reserved_From; "Date Time Reserved From") { }
                column(Date_Reserved_Until; "Date Time Reserved Until") { }

                dataitem(Customer; Customer)
                {
                    PrintOnlyIfDetail = true;
                    DataItemLink = "No." = FIELD("Customer Number");
                    DataItemLinkReference = "Finished Auto Rent Header";
                    column(Name; Name) { }
                    dataitem("Finished Auto Rent Line"; "Finished Auto Rent Line")
                    {
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
            LayoutFile = './Layout/Rent History.rdl';
        }
    }
}
