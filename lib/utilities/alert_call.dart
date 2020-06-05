//                MyAlert(
//                  context: context,
//                  style: kAlertStyle,
//                  title: title,
//                  desc: desc,
//                  buttons: [
//                    DialogButton(
//                      child: Text(
//                        "Yes",
//                        style: TextStyle(color: Colors.white, fontSize: 20),
//                      ),
//                      onPressed: () => {
//                        dbHelper.deleteMassages(
//                            table: dbHelper.historyTable,
//                            mobile: widget.mobile),
//                        mySnackBar(
//                            context: context,
//                            msg:
//                                'All Massages successfully deleted for this Mobile No!'),
//                        refreshList(),
//                        Navigator.pop(context),
//                      },
//                    ),
//                    DialogButton(
//                      child: Text(
//                        "Cancel",
//                        style: TextStyle(color: Colors.white, fontSize: 20),
//                      ),
//                      onPressed: () => Navigator.pop(context),
//                    )
//                  ],
//                ).show();