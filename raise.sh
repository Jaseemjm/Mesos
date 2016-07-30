#!/bin/bash
options()
{
echo -e ">>>>>>>>> OPTIONS <<<<<<<<<<";
echo -e "[1] New limit continues to apply during or after the current month";
echo -e "[2] New limit applies only for the current month";
echo -e "[0] Exit";
echo -e ">>>>>>>>>>>>> <<<<<<<<<<<<<<";

read choice
case $choice in
1)
echo "---Set the member ID and new maximum usable points--";
echo "Input values in the format: Member ID, Maximum usable points per redemption, and maximum usable points per month";
echo "Eg: 123456,300000,100000";
read p_limit
if [ -f change.list ]
then
echo "$p_limit" >> change.list;
fi
echo "-- Inputs added --";
echo " ";
for i in `cat change.list`
do
echo $i;
done
echo " ";
	echo -e "Do you want to SAVE the changes to 'change.list' file?"
        echo -e "[y] Changes will be saved to 'change.list' and Batch will be executed";
        echo -e "[n] Changes will be reverted";
        read choice1
        case $choice1 in
        y)
        php batch.php >> result.log;
	cat result.log;	
        ;;
        n)
	echo " ";
	sed -i "/$p_limit/d" change.list;
	echo " ";
        echo "~~~ CHANGES REVERTED ~~~";
	for i in `cat change.list`
	do
	echo $i;
	done
	echo " ";
        ;;
        *)
        echo -e "$RED Wrong option selected !! $N_C";
        exit
        ;;
        esac
;;
2)
echo "You have selected Option 2";
;;
0)
exit
;;
*)
echo -e "$RED Wrong option selected !! $N_C";
options
;;
esac
}
while true
do
options
done


  batch_exe()
     {
        echo -e "Do you want to SAVE the changes to 'change.list' file?"
        echo -e "[y] Changes will be saved to 'change.list' and Batch will be executed";
        echo -e "[n] Changes will be reverted";
        read choice1
        case $choice1 in
        y)
        echo "Job Done";
        ;;
        n)
        echo "Changes reverted";
        ;;
        *)
        echo -e "$RED Wrong option selected !! $N_C";
        exit
        ;;
        esac
      }
