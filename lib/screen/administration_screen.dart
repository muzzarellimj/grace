import 'package:flutter/material.dart';
import 'package:grace/model/authentication/profile.dart';
import 'package:grace/model/authentication/role.dart';
import 'package:grace/model/authentication/status.dart';
import 'package:grace/model/response/get_user_set.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/theme/measurement.dart';
import 'package:grace/widget/link/embedded_link.dart';
import 'package:grace/widget/toast/toast.dart';

class AdministrationScreen extends StatefulWidget {
  final AuthenticationService authenticationService;

  const AdministrationScreen({
    super.key,
    required this.authenticationService,
  });

  @override
  State<AdministrationScreen> createState() => AdministrationScreenState();
}

class AdministrationScreenState extends State<AdministrationScreen> {
  final ScrollController scrollController = ScrollController();

  List<Profile> users = [];
  String? message;

  @override
  void initState() {
    super.initState();

    init().then((_) {
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(Toast.failure(
          context,
          message!,
        ).asSnackbar());
      }

      message = null;
    });
  }

  Future<void> init() async {
    GetUserSetResponse response =
        await widget.authenticationService.adminGetUserSet();

    setState(() {
      if (response.message != null) {
        message = response.message;
      }

      users = response.users ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(Measurement.getSpacing(4.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Administration Dashboard',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Measurement.getSpacing(3.0)),
            ),
            Card(
              color: Theme.of(context).canvasColor,
              elevation: 0,
              child: Container(
                padding: EdgeInsets.all(Measurement.getSpacing(3.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: Measurement.getSpacing(1.0),
                      ),
                    ),
                    Text(
                      'User Management',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Scrollbar(
                      controller: scrollController,
                      thickness: Measurement.getSizing(0.5),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: Measurement.getSpacing(1.5),
                          ),
                          child: DataTable(
                            horizontalMargin: Measurement.getSpacing(0.25),
                            columns: const [
                              DataColumn(label: Text('#')),
                              DataColumn(label: Text('Email Address')),
                              DataColumn(label: Text('First Name')),
                              DataColumn(label: Text('Last Name')),
                              DataColumn(label: Text('Role')),
                              DataColumn(label: Text('Status')),
                              DataColumn(label: Text('Actions')),
                              DataColumn(label: Text('')),
                            ],
                            rows: List.generate(users.length, (int index) {
                              Profile profile = users[index];

                              return DataRow(
                                cells: [
                                  DataCell(Text(profile.id)),
                                  DataCell(Text(profile.email ?? '-')),
                                  DataCell(Text(profile.firstName)),
                                  DataCell(Text(profile.lastName)),
                                  DataCell(Text(profile.role.name)),
                                  DataCell(Text(profile.status.name)),
                                  DataCell(
                                    EmbeddedLink(
                                      label: profile.status == Status.active
                                          ? 'Restrict'
                                          : 'Unrestrict',
                                      onTap: () =>
                                          profile.status == Status.active
                                              ? handleStatusButton(
                                                  profile.id, Status.restricted)
                                              : handleStatusButton(
                                                  profile.id, Status.active),
                                    ),
                                  ),
                                  DataCell(
                                    EmbeddedLink(
                                      label: profile.role == Role.user
                                          ? 'Promote'
                                          : 'Demote',
                                      onTap: () => profile.role == Role.user
                                          ? handleRoleButton(
                                              profile.id, Role.administrator)
                                          : handleRoleButton(
                                              profile.id, Role.user),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleStatusButton(String id, Status status) async {
    String? message =
        await widget.authenticationService.adminUpdate(id, status: status);

    if (message != null) {
      setState(() {
        message = message;
      });
    } else {
      init();
    }
  }

  void handleRoleButton(String id, Role role) async {
    String? message =
        await widget.authenticationService.adminUpdate(id, role: role);

    if (message != null) {
      setState(() {
        message = message;
      });
    } else {
      init();
    }
  }
}
