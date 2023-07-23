table 50130 "Auto Setup"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Auto Number Serie"; Code[20]) { }

        field(3; "Rent Card Serie"; Code[20]) { }

        field(4; "Attachments Location"; Text[100])
        {
            TableRelation = Location;
        }
    }

    keys
    {
        key(PK; "Primary Key") { Clustered = true; }
    }

    trigger OnInsert()
    var
        KeyWord: Label 'SETUP ';
    begin
        //Initialization of primary key  
        "Primary Key" := KeyWord + format(Count + 1);
    end;
}