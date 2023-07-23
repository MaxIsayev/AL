table 50133 "Auto"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Auto List";

    fields
    {
        field(1; "Number"; Code[20])
        {
            Caption = 'Auto Number';
        }

        field(2; "Name"; Text[200])
        {
            Caption = 'Auto Name';
        }

        field(3; "Mark"; Code[20])
        {
            Caption = 'Auto Mark';
            TableRelation = "Auto Mark";
        }

        field(4; "Model"; Code[20])
        {
            Caption = 'Auto Model';
            TableRelation = "Auto Model"."Auto Model Code"
                            where("Auto Mark Code" = field("Mark"));
        }

        field(5; "Production Year"; Integer)
        {
            Caption = 'Auto Production Year';
        }

        field(6; "Civil Insurance Validity Until"; Date)
        {
            Caption = 'Civil Insurance Validity Until';
        }

        field(7; "TI Validity Until"; Date)
        {
            Caption = 'Technical Inspection Validity Until';
        }

        field(8; "Place Code"; Code[10])
        {
            Caption = 'Auto Place Code';
            TableRelation = Location;
        }

        field(9; "Rent Service"; Text[100])
        {
            Caption = 'Auto Rent Service Number';
            TableRelation = Resource;
        }

        field(10; "Rent Price"; Decimal)
        {
            Caption = 'Auto Rent Price';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula =
                lookup(Resource."Unit Price"
                        where("No." = field("Rent Service")));
        }
    }

    keys
    {
        key(Key1; "Number") { Clustered = true; }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        AutoSetup: Record "Auto Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        //Number serie is assigned by Auto Setup 
        if "Number" = '' then begin
            //AutoSetup.Get() may not work because of some bugs in auto setup (empty or duplicate record created)
            if not AutoSetup.Get() then
                AutoSetup.FindLast();
            AutoSetup.TestField("Auto Number Serie");
            "Number" := NoSeriesManagement.GetNextNo(AutoSetup."Auto Number Serie", WorkDate(), true);
        end;
    end;
}
