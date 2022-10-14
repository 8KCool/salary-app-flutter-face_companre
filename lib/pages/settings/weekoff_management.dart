import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/image_urls.dart';
import 'package:salaryredesign/constants/sized_box.dart';
import 'package:salaryredesign/functions/navigation_functions.dart';
import 'package:salaryredesign/services/webservices.dart';
import 'package:salaryredesign/widgets/CustomLoader.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/custom_widgets.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import '../../constants/globalkeys.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import 'dart:convert' as convert;
import '../../widgets/avatar.dart';
import '../../widgets/customtextfield.dart';
import '../../widgets/multi_select_dropdwon.dart';
import '../../widgets/showSnackbar.dart';
import 'add_holiday_branch.dart';

class WeekOff_Management_Page extends StatefulWidget {
  const WeekOff_Management_Page({Key? key}) : super(key: key);

  @override
  State<WeekOff_Management_Page> createState() => WeekOff_Management_PageState();
}

class WeekOff_Management_PageState extends State<WeekOff_Management_Page> {
  TextEditingController name = TextEditingController();
  TextEditingController dummy = TextEditingController();
  // TextEditingController day = TextEditingController();
  // TextEditingController time = TextEditingController();
String day='';
String time='';

  List image=[
    MyImages.avtarone,
    MyImages.avatr8,
    MyImages.avatr3,
    MyImages.avatr4,
    MyImages.avatr5,
    MyImages.avatr6,
  ];

  List<String> selectedItems = [];
  List<String> selectedItemsEdit = [];

  List items =['Week 1','Week 2','Week 3','Week 4','Week 5'];
  List IDs=[];
  getWeekoffList()async{
    await Provider.of<GlobalModal>(context, listen: false)
        .loadingShow();
    var res =await Webservices.getData(ApiUrls.weekoffList,context);

    var result1 = convert.jsonDecode(res.body);
    await Provider.of<GlobalModal>(context, listen: false)
        .loadingHide();
    log("res-------------${result1['permission']}");
    await Provider.of<GlobalModal>(context, listen: false)
        .weekOffSetting(result1['data']['weekOff'],result1['data']['branch'],result1['data']['department'],result1['permission']);
  setState(() {

  });
  }
  text(g,gg){
    log('text(globalModal.holiday[i].branchId[j],globalModal),------------${gg.brnc.toString()}');
    return gg.brnc[g.toString()]!=null?
    gg.brnc[g.toString()]['name'].toString()+' , ':'${gg.brnc[g.toString()]} , ';
  }
  @override
  void initState() {
    // TODO: implement initState
    getWeekoffList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: appBar(context: context, title: 'Weekoff Settings', titlecenter: false),
      body: Consumer<GlobalModal>(
          builder: (context,globalModal,child) {
          return globalModal.load?CustomLoader():SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.only(
                    //   bottomLeft: Radius.circular(30),
                    //   bottomRight: Radius.circular(30),
                    // )
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainHeadingText(text: 'Weekoff Management', fontSize: 20,),
                          hSizedBox,
                          hSizedBox05,
                          if(globalModal.branchPermission['add'])
                          RoundEdgedButton(
                            text: 'Add New',
                            verticalPadding: 0,
                            color: MyColors.primaryColor,
                            width: 80,
                            horizontalPadding: 0,
                            height: 35,
                            onTap: (){
                              dummy.text='';
                              day='';
                              time='';
                              selectedItems=[];
                              String selectedday='';
                              bottomsheet(

                                height: 540,
                                context: context,
                                child:
                                StatefulBuilder(
                                    builder:
                                        (BuildContext
                                    context,
                                        StateSetter
                                        setState) {
                                      return Scaffold(
                                        body: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            vSizedBox4,
                                            MainHeadingText(text: 'Add Weekoff', fontSize: 20, color: MyColors.black,),
                                            vSizedBox,
                                            GestureDetector(
                                              onTap: () async {

                                                IDs=await push(context: context, screen: SelectBranchPage());
                                                print('132354646------------${IDs.toString()}');
                                                dummy.text=IDs[0]['branchName'].toString().substring(1,IDs[0]['branchName'].toString().length-1)+','+IDs[0]['depName'].toString().substring(1,IDs[0]['depName'].toString().length-1);
                                                // setState((){});
                                              },
                                              child:  CustomTextField(controller: dummy, hintText: '',
                                                label: 'Choose Department',
                                                showlabel: true,
                                                labelcolor: MyColors.bordercolor,
                                                // prefixIcon: MyImages.date,
                                                suffixheight: 25,
                                                paddingsuffix: 20,
                                                enabled: false,
                                              ),
                                            ),

                                            // DropDwon(
                                            //   islabel: true,
                                            //   label: 'Choose Branch',
                                            //   items: [''],
                                            // ),
                                            // DropDwon(
                                            //   islabel: true,
                                            //   label: 'Choose Department',
                                            //   items: [''],
                                            // ),
                                            DropDwon(
                                              selectedValue:day==null?'jhfjf':day.toString(),
                                              islabel: true,
                                              label: 'Choose Day',
                                              items: ['Sunday','Monday','Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
                                              onChange: (value){
                                                print("valuue---------${value}");
                                                if(value!=null){
                                                  day=value;
                                                  selectedday=value;
                                                  setState((){});
                                                }

                                              },
                                            ),
                                            DropDwon(
                                              selectedValue: time,
                                              islabel: true,
                                              label: 'Choose Type',
                                              items: ['Halfday','Fullday'],
                                              onChange: (value){
                                                print("valuue---------${value}");
                                                if(value!=null){
                                                  time=value;
                                                  setState((){});
                                                }
                                              },
                                            ),
                                            MultiDropDwon(onChange: (st) {  },
                                              label: 'Choose Week',
                                              // selectedValue: selectedItems??[],
                                              items:items.map((item) {
                                                return DropdownMenuItem<String>(
                                                  value: item,
                                                  //disable default onTap to avoid closing menu when selecting an item
                                                  enabled: false,
                                                  child: StatefulBuilder(
                                                    builder: (context, menuSetState) {
                                                      final _isSelected = selectedItems.contains(item);
                                                      return InkWell(
                                                        onTap: () {
                                                          _isSelected
                                                              ? selectedItems.remove(item)
                                                              : selectedItems.add(item);
                                                          print("selectedItems--------------${selectedItems}");
                                                          //This rebuilds the StatefulWidget to  the button's text
                                                          setState(() {});
                                                          //This rebuilds the dropdownMenu Widget to  the check mark
                                                          menuSetState(() {});
                                                        },
                                                        child: Container(
                                                          height: double.infinity,
                                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                                          child: Row(
                                                            children: [
                                                              _isSelected
                                                                  ? const Icon(Icons.check_box_outlined)
                                                                  : const Icon(Icons.check_box_outline_blank),
                                                              const SizedBox(width: 16),
                                                              Text(
                                                                item,
                                                                style: const TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              }).toList(),
                                              selectedValue: selectedItems.isEmpty ? null : selectedItems.last,



                                          selectedItemBuilder: (context) {
                                            return items.map(
                                                  (item) {
                                                return Container(
                                                  alignment: AlignmentDirectional
                                                      .centerStart,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                                  child: Text(
                                                    selectedItems.join(', '),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                );
                                              },
                                            ).toList();
                                          }


                                            ),
                                            // DropDwon(
                                            //   islabel: true,
                                            //   label: 'Choose Week',
                                            //   items: [''],
                                            // ),
                                            vSizedBox2,
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: RoundEdgedButton(
                                                    text: 'Cancel',
                                                    onTap: (){
                                                      Navigator.pop(context);
                                                    },
                                                    color: MyColors.scaffold,
                                                    textColor: MyColors.black,
                                                    fontSize: 16,
                                                    fontfamily: 'bold',
                                                  ),
                                                ),
                                                hSizedBox,
                                                Expanded(
                                                  child: RoundEdgedButton(
                                                    text: 'Save',
                                                    onTap: ()async{
                                                      if(IDs.length==0){
                                                        showSnackbar(context,"Please select Branch");
                                                      }else  if(day==''){
                                                        showSnackbar(context,"Please select Day");
                                                      }else  if(time==''){
                                                        showSnackbar(context,"Please select Type");
                                                      }else  if(selectedItems.length==0){
                                                        showSnackbar(context,"Please select Week");
                                                      }
                                                      else{
                                                        Map<String,dynamic>data={
                                                          'branch_id':IDs[0]['branchId'].toString().substring(1,IDs[0]['branchId'].toString().length-1),
                                                          'department_id':IDs[0]['depIds'].toString().substring(1,IDs[0]['depIds'].toString().length-1),
                                                          'day':day,
                                                          'type':time=='Halfday'?'1':'2',
                                                          'weeks':selectedItems.toString().substring(1,selectedItems.toString().length-1)
                                                        };
                                                        print("datat---------${data}");
                                                        var res= await Webservices.postData(apiUrl:ApiUrls.weekoffStore, body: data, context: context);
                                                        print("res---------${res}");
                                                        Navigator.pop(context);
                                                        await getWeekoffList();
                                                      }


                                                    },
                                                    fontSize: 16,
                                                    fontfamily: 'bold',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            vSizedBox4,
                                          ],
                                        ),
                                      );
                                    }
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                vSizedBox,
                Container(
                  width: MediaQuery.of(context).size.width,
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  // padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      vSizedBox,

                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top:16,bottom: 32,left: 16,right: 16),
                            decoration: BoxDecoration(
                              color: MyColors.white
                            ),
                            child:globalModal.weekOff.length==0?Text('No Data Found') :Column(
                              children: [
                                for(var i=0; i<globalModal.weekOff.length;i++)
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ParagraphText(
                                                  text: '${globalModal.weekOff[i].day} - ${globalModal.weekOff[i].type==2?'Full Day':'Half Day'} ',
                                                  color: MyColors.green,
                                                  fontSize: 14,
                                                  fontFamily: 'semibold',
                                                ),
                                                vSizedBox05,
                                                MainHeadingText(
                                                  text: globalModal.weekOff[i].weeks, color: MyColors.black, fontFamily: 'semibold', fontSize: 16,),
                                                vSizedBox2,
                                                ParagraphText(
                                                  text: 'Applied on',
                                                  fontSize: 14,
                                                  fontFamily: 'bold',
                                                  color: MyColors.bordercolor,
                                                ),



                                                vSizedBox05,
                                                if(globalModal.weekOff[i].branchId.length==0)
                                                  ParagraphText(
                                                    text: 'All Branches & All Departments',
                                                    fontSize: 16,
                                                  ),
                                                if(globalModal.weekOff[i].branchId.length>0)

                                                //
                                                  Wrap(
                                                    children: [
                                                      for(int j=0 ; j<globalModal.weekOff[i].branchId.length; j++)
                                                        ParagraphText(text:text(globalModal.weekOff[i].branchId[j],globalModal)!=null?text(globalModal.weekOff[i].branchId[j],globalModal):"",
                                                           fontSize: 16,

                                                        ),
                                                    ],
                                                  ),

                                                Wrap(
                                                  children: [
                                                    for(int j=0 ; j<globalModal.weekOff[i].departmentId.length; j++)

                                                      ParagraphText(
                                                        text:globalModal.dep[globalModal.weekOff[i].departmentId[j].toString()]!=null?
                                                        globalModal.dep[globalModal.weekOff[i].departmentId[j].toString()]['name'].toString()+' , ':'',
                                                        fontSize: 16,
                                                        // color: MyColors.black,
                                                      ),
                                                  ],
                                                ),
                                                vSizedBox05,
                                                // ParagraphText(
                                                //   text: 'All Branches & All Departments',
                                                //   fontSize: 16,
                                                // ),
                                              ],
                                            ),
                                          ),
                                          if(globalModal.branchPermission['edit'] || globalModal.branchPermission['delete'])
                                          PopupmenuButtonCustom(
                                            onTapedit: ()async{
                                              Navigator.pop(context);
                                              dummy.text='';
                                              day=globalModal.weekOff[i].day;
                                              time=globalModal.weekOff[i].type==1?'Halfday':'Fullday';
                                              selectedItemsEdit=globalModal.weekOff[i].weeks.replaceAll(', ',',').split(',');
                                              print("globalModal.weekOff[i].weeks${globalModal.weekOff[i].weeks}");
                                              print("selectedItems----------------edit---------${selectedItemsEdit}");

                                              // [Week 1, Week 2, Week 4]
                                              // [Week 1, Week 2, Week 3, Week 5]
                                              // [Week 1, Week 2, Week 4]
                                              var branchIDs = [];
                                              var depIDs = [];
                                              var branchName = [];
                                              var depName = [];
                                              for (var ii = 0; ii <globalModal.departmentBranch.length; ii++) {
                                                for(int j=0 ; j<globalModal.weekOff[i].branchId.length; j++) {
                                                  print('departmentbranchId----------------------${globalModal.departmentBranch[ii]['id']},${globalModal.weekOff[i].branchId[j]}');
                                                  // print('bracch----------------------${globalModal.weekOff[i].branchId[j]}');

                                                  if (globalModal.departmentBranch[ii]['id'].toString()
                                                      ==globalModal.weekOff[i].branchId[j].toString())
                                                     {
                                                    branchIDs.add(globalModal.departmentBranch[ii]['id']);
                                                    branchName.add(globalModal.departmentBranch[ii]['name']);
                                                    //
                                                }
                                                  print('bracch----------------------${branchIDs}${branchName}---${globalModal.weekOff[i].departmentId.length}');
                                                }
                                              }


                                              for (var ii = 0; ii <globalModal.departhhh.length; ii++) {
                                                for(int j=0 ; j<globalModal.weekOff[i].departmentId.length; j++) {
                                                  print('departmentbranchId----------------------${globalModal.departhhh[ii]['id']},${globalModal.weekOff[i].departmentId[j]}');
                                                  // print('bracch----------------------${globalModal.weekOff[i].branchId[j]}');

                                                  if (globalModal.departhhh[ii]['id'].toString()
                                                      ==globalModal.weekOff[i].departmentId[j].toString())
                                                  {
                                                    depIDs.add(globalModal.departhhh[ii]['id']);
                                                    depName.add(globalModal.departhhh[ii]['name']);
                                                    //
                                                  }
                                                  print('bracch-------dep---------------${branchIDs}${branchName}-');
                                                }
                                              }
                                              print('taolta ida -----branchIDs-------${branchIDs}');
                                              print('taolta ida -------branchName-----${branchName}');
                                              print('taolta ida -----depIDs-------${depIDs}');
                                              print('taolta ida -----depName-------${depName}');

                                              branchIDs = branchIDs.toSet().toList();
                                              var Ids = [];
                                              Ids.add({
                                              "branchId": branchIDs,
                                              "depIds": depIDs,
                                              "branchName": branchName,
                                              "depName": depName
                                              });
                                              IDs=Ids;
                                              dummy.text=IDs[0]['branchName'].toString().substring(1,IDs[0]['branchName'].toString().length-1)+','+IDs[0]['depName'].toString().substring(1,IDs[0]['depName'].toString().length-1);

                                              bottomsheet(
                                                  height: 540,
                                                  context: context,
                                                  child:
                                                  StatefulBuilder(
                                                      builder:
                                                          (BuildContext
                                                      context,
                                                          StateSetter
                                                          setState) {
                                                        return Scaffold(
                                                          body: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              vSizedBox4,
                                                              MainHeadingText(text: 'Edit Weekoff', fontSize: 20, color: MyColors.black,),
                                                              vSizedBox,
                                                              GestureDetector(
                                                                onTap: () async {

                                                                  IDs=await push(context: context, screen: SelectBranchPage(branchId: branchIDs,depId: depIDs,));
                                                                  print('132354646------------${IDs.toString()}');
                                                                  dummy.text=IDs[0]['branchName'].toString().substring(1,IDs[0]['branchName'].toString().length-1)+','+IDs[0]['depName'].toString().substring(1,IDs[0]['depName'].toString().length-1);
                                                                  // setState((){});
                                                                },
                                                                child:  CustomTextField(controller: dummy, hintText: '',
                                                                  label: 'Choose Department',
                                                                  showlabel: true,
                                                                  labelcolor: MyColors.bordercolor,
                                                                  // prefixIcon: MyImages.date,
                                                                  suffixheight: 25,
                                                                  paddingsuffix: 20,
                                                                  enabled: false,
                                                                ),
                                                              ),

                                                              // DropDwon(
                                                              //   islabel: true,
                                                              //   label: 'Choose Branch',
                                                              //   items: [''],
                                                              // ),
                                                              // DropDwon(
                                                              //   islabel: true,
                                                              //   label: 'Choose Department',
                                                              //   items: [''],
                                                              // ),
                                                              DropDwon(
                                                                selectedValue:day.toString(),
                                                                islabel: true,
                                                                label: 'Choose Day',
                                                                items: ['Sunday','Monday','Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
                                                                onChange: (value){
                                                                  print("valuue---------${value}");
                                                                  if(value!=null){
                                                                    day=value.toString();
                                                                    print("valuue--------day-${day.toString()}");

                                                                    setState((){});
                                                                  }

                                                                },
                                                              ),
                                                              DropDwon(
                                                                selectedValue: time,
                                                                islabel: true,
                                                                label: 'Choose Type',
                                                                items: ['Halfday','Fullday'],
                                                                onChange: (value){
                                                                  print("valuue---------${value}");
                                                                  if(value!=null){
                                                                    time=value;
                                                                    setState((){});
                                                                  }
                                                                },
                                                              ),
                                                              MultiDropDwon(onChange: (st) {  },
                                                                label: 'Choose Week',
                                                                // selectedValue: selectedItemsEdit.join(','),
                                                                items:items.map((item) {
                                                                  return DropdownMenuItem<String>(
                                                                    value: item,
                                                                    //disable default onTap to avoid closing menu when selecting an item
                                                                    enabled: false,
                                                                    child: StatefulBuilder(
                                                                      builder: (context, menuSetState) {
                                                                        final _isSelected = selectedItemsEdit.contains(item);
                                                                        return InkWell(
                                                                          onTap: () {
                                                                            _isSelected
                                                                                ? selectedItemsEdit.remove(item)
                                                                                : selectedItemsEdit.add(item);
                                                                            print("selectedItems--------------${selectedItemsEdit}");
                                                                            //This rebuilds the StatefulWidget to  the button's text
                                                                            setState(() {});
                                                                            //This rebuilds the dropdownMenu Widget to  the check mark
                                                                            menuSetState(() {});
                                                                          },
                                                                          child: Container(
                                                                            height: double.infinity,
                                                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                                                            child: Row(
                                                                              children: [
                                                                                _isSelected
                                                                                    ? const Icon(Icons.check_box_outlined)
                                                                                    : const Icon(Icons.check_box_outline_blank),
                                                                                const SizedBox(width: 16),
                                                                                Text(
                                                                                  item,
                                                                                  style: const TextStyle(
                                                                                    fontSize: 14,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  );
                                                                }).toList(),
                                                                selectedValue: selectedItemsEdit.isEmpty ? null : selectedItemsEdit.last,
                                                                selectedItemBuilder: (context) {
                                                                  return items.map(
                                                                        (item) {
                                                                      return Container(
                                                                        alignment: AlignmentDirectional.centerStart,
                                                                        padding:  EdgeInsets.symmetric(horizontal: 16.0),
                                                                        child: Text(
                                                                          selectedItemsEdit.join(', '),
                                                                          style:  TextStyle(
                                                                            fontSize: 14,
                                                                            overflow: TextOverflow.ellipsis,
                                                                          ),
                                                                          maxLines: 1,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).toList();
                                                                },
                                                                // selectedValue: selectedItems.isEmpty ? null : selectedItems.last,
                                                              ),
                                                              // DropDwon(
                                                              //   islabel: true,
                                                              //   label: 'Choose Week',
                                                              //   items: [''],
                                                              // ),
                                                              vSizedBox2,
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: RoundEdgedButton(
                                                                      text: 'Cancel',
                                                                      onTap: (){
                                                                        Navigator.pop(context);
                                                                      },
                                                                      color: MyColors.scaffold,
                                                                      textColor: MyColors.black,
                                                                      fontSize: 16,
                                                                      fontfamily: 'bold',
                                                                    ),
                                                                  ),
                                                                  hSizedBox,
                                                                  Expanded(
                                                                    child: RoundEdgedButton(
                                                                      text: 'Update',
                                                                      onTap: ()async{
                                                                        if(IDs.length==0){
                                                                          showSnackbar(context,"Please select Branch");
                                                                        }else  if(day==''){
                                                                          showSnackbar(context,"Please select Day");
                                                                        }else  if(time==''){
                                                                          showSnackbar(context,"Please select Type");
                                                                        }else  if(selectedItemsEdit.length==0){
                                                                          showSnackbar(context,"Please select Week");
                                                                        }
                                                                        else{
                                                                          Map<String,dynamic>data={
                                                                            'branch_id':IDs[0]['branchId'].toString().substring(1,IDs[0]['branchId'].toString().length-1),
                                                                            'department_id':IDs[0]['depIds'].toString().substring(1,IDs[0]['depIds'].toString().length-1),
                                                                            'day':day,
                                                                            'type':time=='Halfday'?'1':'2',
                                                                            'weeks':selectedItemsEdit.toString().substring(1,selectedItemsEdit.toString().length-1),
                                                                            'id':globalModal.weekOff[i].id.toString()
                                                                          };
                                                                          print("datat---------${data}");
                                                                          var res= await Webservices.postData(apiUrl:ApiUrls.weekoffupdate, body: data, context: context);
                                                                          print("res---------${res}");
                                                                          Navigator.pop(context);
                                                                          await getWeekoffList();
                                                                        }


                                                                      },
                                                                      fontSize: 16,
                                                                      fontfamily: 'bold',
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              vSizedBox4,
                                                            ],
                                                          ),
                                                        );
                                                      }
                                                  ),
                                                );

                                            },
                                            // editbtn: true,
                                            deletemain: 'Delete This Weekoff',
                                            deletesub: 'Do you wish to delete this Weekoff ?',
                                            isEdit: globalModal.branchPermission['edit'],
                                            isDelete: globalModal.branchPermission['delete'],
                                            DeleteFun: () async{
                                              Navigator.pop(context);
                                              Map<String, dynamic> data =
                                              {
                                                'id': globalModal.weekOff[i].id.toString()
                                              };
                                              var res = await Webservices
                                                  .postData(
                                                  apiUrl: ApiUrls
                                                      .weekoffDelete,
                                                  body: data,
                                                  context: context);
                                              print('dekleder-------------${res}');
                                              await getWeekoffList();
                                              showSnackbar(context, res['message'].toString());

                                            },
                                          ),

                                          // vSizedBox2,
                                        ],
                                      ),
                                    ),
                                    Divider(height: 40, color: Color(0xFFCAD8D8),)
                                  ],
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(height: 10,),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
