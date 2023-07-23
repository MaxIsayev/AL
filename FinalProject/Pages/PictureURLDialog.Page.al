page 50140 "Picture URL Dialog"
{
    PageType = StandardDialog;
    Caption = 'Picture URL Dialog';

    layout
    {
        area(content)
        {
            field(ItemNo; ItemNo)
            {
                ApplicationArea = All;
                Caption = 'Item No.';
                Editable = false;
            }
            field(ItemDesc; ItemDesc)
            {
                ApplicationArea = All;
                Caption = 'Item Description';
                Editable = false;
            }
            field(PictureURL; PictureURL)
            {
                ApplicationArea = All;
                Caption = 'Picture URL';
                ExtendedDatatype = URL;
            }
        }
    }

    var
        ItemNo: Code[20];
        ItemDesc: Text[100];
        PictureURL: Text;

    procedure SetItemInfo(NewItemNo: Code[20]; NewItemDesc: Text[100])
    begin
        ItemNo := NewItemNo;
        ItemDesc := NewItemDesc;
    end;

    procedure ImportItemPictureFromURL(var RecordSelected: Record "Auto Rent Header")
    var
        Item: Record Item;
        Client: HttpClient;
        Content: HttpContent;
        Response: HttpResponseMessage;
        InStr: InStream;
        ItemShouldExistInItemsTable: Label ' item should exist in Items table';
        DemoPictureForItem: Label 'Demo picture for item';
    begin
        Client.Get(PictureURL, Response);
        Response.Content.ReadAs(InStr);

        if Item.Get(ItemNo) then begin
            Clear(Item.Picture);
            Item.Picture.ImportStream(InStr, DemoPictureForItem + Format(Item."No."));
            Item.Modify(true);
            RecordSelected."Driver License" := Item.Picture;
            RecordSelected.Modify();
        end else
            Message(ItemNo + ItemShouldExistInItemsTable);
    end;
}