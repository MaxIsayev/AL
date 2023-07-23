codeunit 50130 "Return Car"
{
    procedure ReturnCar(CarNumber: Code[20]; AutoRentHeaderNumber: Code[20])
    var
        AutoRentDamageRecord: Record "Auto Rent Damage";
        AutoDamageRecord: Record "Auto Damage";

        AutoRentHeaderRecord: Record "Auto Rent Header";
        FinishedAutoRentHeaderRecord: Record "Finished Auto Rent Header";

        ZeroDamageText: Label 'No damage registered in Auto Rent Damage table!';
        EmptyFilterText: Label '';
    begin
        //transfer all damages (from Auto Rent Damage to Auto Damage)
        if not AutoRentDamageRecord.FindSet() then begin
            Message(ZeroDamageText);
            //transfer 'auto rent lines' to finished not using filter               
            AutoRentLinesTransfer(EmptyFilterText);
        end
        else
            repeat
                AutoDamageRecord.Init();

                AutoDamageRecord."Car Number" := CarNumber;
                //transfer 'auto rent lines' to finished by document number                
                AutoRentLinesTransfer(AutoRentDamageRecord."Document Number");

                AutoDamageRecord."Line Number" := AutoRentDamageRecord."Line Number";
                AutoDamageRecord."Damage Date" := AutoRentDamageRecord."Damage Date";
                AutoDamageRecord."Description" := AutoRentDamageRecord."Description";
                AutoDamageRecord."Status" := AutoDamageRecord."Status"::Actual;

                AutoDamageRecord.Insert();
                //delete auto rent damage record
                AutoRentDamageRecord.Delete();
            until AutoRentDamageRecord.Next() = 0;

        //Data transfer from Simple Auto Rent Header to Finished        
        AutoRentHeaderRecord.SetFilter("Number", AutoRentHeaderNumber);
        if AutoRentHeaderRecord.FindSet() then
            repeat
                //Create Finished Auto Rent Header
                FinishedAutoRentHeaderRecord.Init();
                //Transfer TO Finished Auto Rent Header FROM Auto Rent Header
                FinishedAutoRentHeaderRecord."Number" := AutoRentHeaderRecord."Number";
                FinishedAutoRentHeaderRecord."Customer Number" := AutoRentHeaderRecord."Customer Number";
                FinishedAutoRentHeaderRecord."Driver License" := AutoRentHeaderRecord."Driver License";
                FinishedAutoRentHeaderRecord."Auto Rent Date" := AutoRentHeaderRecord."Auto Rent Date";
                FinishedAutoRentHeaderRecord."Car Number" := AutoRentHeaderRecord."Car Number";
                FinishedAutoRentHeaderRecord."Date Time Reserved From" := AutoRentHeaderRecord."Date Time Reserved From";
                FinishedAutoRentHeaderRecord."Date Time Reserved Until" := AutoRentHeaderRecord."Date Time Reserved Until";
                FinishedAutoRentHeaderRecord."Reservation Sum" := AutoRentHeaderRecord."Reservation Sum";

                FinishedAutoRentHeaderRecord.Insert();
                //Delete Auto Rent Header
                AutoRentHeaderRecord.Delete();
            until AutoRentHeaderRecord.Next() = 0;
    end;

    local procedure AutoRentLinesTransfer(DocumentNumber: Code[20])
    var
        AutoRentLineRecord: Record "Auto Rent Line";
        FinishedAutoRentLineRecord: Record "Finished Auto Rent Line";
    begin
        //Data transfer from Simple Auto Rent Line to Finished Auto rent line                
        AutoRentLineRecord.Reset();
        //filtering 'auto rent line' by document number get from 'auto rent damage'
        AutoRentLineRecord.SetFilter("Document Number", DocumentNumber);
        if AutoRentLineRecord.FindSet() then
            repeat
                //Create Finished Auto Rent Line
                FinishedAutoRentLineRecord.Init();
                //Transfer TO Finished Auto Rent LIne FROM Auto Rent Line
                FinishedAutoRentLineRecord."Document Number" := AutoRentLineRecord."Document Number";
                FinishedAutoRentLineRecord."Line Number" := AutoRentLineRecord."Line Number";
                FinishedAutoRentLineRecord."Line Type" := AutoRentLineRecord."Line Type";
                FinishedAutoRentLineRecord."Number" := AutoRentLineRecord."Number";
                FinishedAutoRentLineRecord."Description" := AutoRentLineRecord."Description";
                FinishedAutoRentLineRecord."Quantity" := AutoRentLineRecord."Quantity";
                FinishedAutoRentLineRecord."Unit Price" := AutoRentLineRecord."Unit Price";
                FinishedAutoRentLineRecord."Line Sum" := AutoRentLineRecord."Line Sum";

                FinishedAutoRentLineRecord.Insert();
                //Delete Auto Rent Line
                AutoRentLineRecord.Delete();
            until AutoRentLineRecord.Next() = 0;
    end;
}
