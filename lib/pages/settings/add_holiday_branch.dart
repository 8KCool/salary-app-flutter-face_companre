import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/providers/clock.dart';

import '../../constants/colors.dart';
import '../../widgets/buttons.dart';
import '../../widgets/customtextfield.dart';

class SelectBranchPage extends StatefulWidget {
  final List? branchId;
  final List? depId;

  const SelectBranchPage({Key? key,this.branchId,this.depId}) : super(key: key);

  @override
  State<SelectBranchPage> createState() => _SelectBranchPageState();
}

class _SelectBranchPageState extends State<SelectBranchPage> {
  TextEditingController search = TextEditingController();
  TextEditingController search1 = TextEditingController();

  bool checked = false;
  setData()async{
    if(widget.branchId!=null){
    if(widget.branchId?.length!=0){
      for(var i=0 ; i<await Provider.of<GlobalModal>(context, listen: false).departmentBranch.length;i++){
        for(int j=0 ; j<widget.branchId!.length ;j++){
          if(await Provider.of<GlobalModal>(context, listen: false).departmentBranch[i]['id']==widget.branchId![j]) {
             Provider.of<GlobalModal>(context, listen: false).departmentBranch[i]['checked'] = true;
          }
          }
        }

      }
    }
    else{
      for(var i=0 ; i<await Provider.of<GlobalModal>(context, listen: false).departmentBranch.length;i++) {
        Provider
            .of<GlobalModal>(context, listen: false)
            .departmentBranch[i]['checked'] = false;
      }
    }
  }
  setDep()async{
    if(widget.depId!=null){
      if(widget.depId?.length!=0){
        for(var i=0 ; i<await Provider.of<GlobalModal>(context, listen: false).departhhh.length;i++){
    for(int j=0 ; j<widget.depId!.length ;j++){
    if(await Provider.of<GlobalModal>(context, listen: false).departhhh[i]['id']==widget.depId![j]) {
    Provider.of<GlobalModal>(context, listen: false).departhhh[i]['checked'] = true;
    }
    }
    }

  }
  }
    else{
      for(var i=0 ; i<await Provider.of<GlobalModal>(context, listen: false).departhhh.length;i++) {
        Provider
            .of<GlobalModal>(context, listen: false)
            .departhhh[i]['checked'] = false;
      }
    }
  }
  getData()async{
    await Provider.of<GlobalModal>(context, listen: false).getBranch(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    setData();
    setDep();
    getData();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GlobalModal>(builder: (context, globalModal, child) {
        return Container(
          padding: EdgeInsets.all(16.0),
          // margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.blackcolor70),
            borderRadius: BorderRadius.all(
                Radius.circular(5.0) //                 <--- border radius here
                ),
          ),

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSizedBox4,
                CustomTextField(
                  controller: search1, hintText: '',
                  label: 'Search',
                  showlabel: true,
                  labelcolor: MyColors.black,
                  // prefixIcon: MyImages.date,
                  suffixheight: 25,
                  paddingsuffix: 20,
                  onchange: (str) {
                    print(str);
                    search.text = str;
                    setState(() {});
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      Checkbox(
                          value: checked,
                          onChanged: (bool? newValue) {
                            if (newValue != null) {
                              checked = newValue;

                              for (int i = 0;
                                  i < globalModal.departmentBranch.length;
                                  i++) {
                                if (checked == true) {
                                  globalModal.departmentBranch[i]['checked'] =
                                      true;
                                } else {
                                  globalModal.departmentBranch[i]['checked'] =
                                      false;
                                }
                              }
                              for (int i = 0;
                                  i < globalModal.departhhh.length;
                                  i++) {
                                if (checked == true) {
                                  globalModal.departhhh[i]['checked'] = true;
                                } else {
                                  globalModal.departhhh[i]['checked'] = false;
                                }
                              }

                              setState(() {});
                            }
                          }),
                      Text(
                        'Select All',
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                for (int i = 0; i < globalModal.departmentBranch.length; i++)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          children: [
                            Checkbox(
                                value: globalModal.departmentBranch[i]
                                    ['checked'],
                                onChanged: (bool? newValue) {
                                  if (newValue != null) {
                                    globalModal.departmentBranch[i]['checked'] =
                                        newValue;

                                    for (int k = 0;
                                        k < globalModal.departhhh.length;
                                        k++) {
                                      if (globalModal.departhhh[k]['b_id']
                                              .toString() ==
                                          globalModal.departmentBranch[i]['id'].toString()) if (globalModal
                                              .departmentBranch[i]['checked'] ==
                                          true) {
                                        globalModal.departhhh[k]['checked'] =
                                            true;
                                      } else {
                                        globalModal.departhhh[k]['checked'] =
                                            false;
                                      }
                                    }
                                    setState(() {});
                                  }
                                }),
                            Text(
                              '${globalModal.departmentBranch[i]['name']}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      for (int j = 0; j < globalModal.departhhh.length; j++)
                        if (globalModal.departhhh[j]['b_id'].toString() ==
                            globalModal.departmentBranch[i]['id'].toString())
                          if (globalModal.departhhh[j]['name']
                              .toString()
                              .contains(search.text))
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 0, bottom: 0, right: 8, left: 32),
                              child: Row(
                                children: [
                                  // Text(globalModal.departhhh[i]['checked'].toString()),
                                  Checkbox(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: globalModal.departhhh[j]
                                          ['checked'],
                                      onChanged: (bool? newValue) {
                                        if (newValue != null) {
                                          globalModal.departhhh[j]['checked'] =
                                              newValue;

                                          setState(() {});
                                        }
                                      }),
                                  Expanded(
                                      child: Text(
                                    '${globalModal.departhhh[j]['name']}',
                                    textAlign: TextAlign.start,
                                  )),
                                ],
                              ),
                            ),
                    ],
                  ),
                vSizedBox8,
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: MyColors.primaryColor,

        onPressed: () async {
          var branchIDs = [];
          var depIDs = [];
          var branchName = [];
          var depName = [];
          for (var i = 0; i <await Provider.of<GlobalModal>(context, listen: false).departmentBranch.length; i++) {
            if (await Provider.of<GlobalModal>(context, listen: false).departmentBranch[i]['checked'] == true) {
              print(await Provider.of<GlobalModal>(context, listen: false).departmentBranch[i]['id']);
              branchIDs.add(await Provider.of<GlobalModal>(context, listen: false).departmentBranch[i]['id']);
              branchName.add(await Provider.of<GlobalModal>(context, listen: false).departmentBranch[i]['name']);
            }
          }
          for (var i = 0;
              i < await Provider.of<GlobalModal>(context, listen: false).departhhh.length; i++) {
            if (await Provider.of<GlobalModal>(context, listen: false).departhhh[i]['checked'] == true) {
              print(await Provider.of<GlobalModal>(context, listen: false).departhhh[i]['id']);
              depIDs.add(await Provider.of<GlobalModal>(context, listen: false).departhhh[i]['id']);
              depName.add(await Provider.of<GlobalModal>(context, listen: false).departhhh[i]['name']);
              branchIDs.add(await Provider.of<GlobalModal>(context, listen: false).departhhh[i]['b_id']);
            }
          }
           branchIDs = branchIDs.toSet().toList();
          var Ids = [];
          Ids.add({
            "branchId": branchIDs,
            "depIds": depIDs,
            "branchName": branchName,
            "depName": depName
          });
          print('taolta ida ------------${Ids}');

          Navigator.pop(context, Ids);
        },
        // },

        // icon: const Icon(Icons.edit),
        label: const Text('Done'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
