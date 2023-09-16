import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SizeGuideWidget extends StatelessWidget {
  const SizeGuideWidget({
    super.key,
    required this.tableHeader,
    required this.sizeXXS,
    required this.sizeXS,
    required this.sizeS,
    required this.sizeM,
    required this.sizeL,
    required this.sizeXL,
    required this.sizeXXL,
  });

  final List<String> tableHeader;
  final List<String> sizeXXS;
  final List<String> sizeXS;
  final List<String> sizeS;
  final List<String> sizeM;
  final List<String> sizeL;
  final List<String> sizeXL;
  final List<String> sizeXXL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Table(
              border: TableBorder.all(),
              defaultColumnWidth: FixedColumnWidth(18.sw),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                //Row Header
                TableRow(children: [
                  for (var header in tableHeader)
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          header,
                          style: TextStyle(fontSize: 2.sw),
                        ),
                      ),
                    )
                ]),
                //Row for size XXS
                TableRow(children: [
                  for (var measurement in sizeXXS)
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          measurement,
                          style: TextStyle(fontSize: 2.sw),
                        ),
                      ),
                    )
                ]),
                //Row for size XS
                TableRow(children: [
                  for (var measurement in sizeXS)
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          measurement,
                          style: TextStyle(fontSize: 2.sw),
                        ),
                      ),
                    )
                ]),
                //Row for size S
                TableRow(children: [
                  for (var measurement in sizeS)
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          measurement,
                          style: TextStyle(fontSize: 2.sw),
                        ),
                      ),
                    )
                ]),
                //Row for size M
                TableRow(children: [
                  for (var measurement in sizeM)
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          measurement,
                          style: TextStyle(fontSize: 2.sw),
                        ),
                      ),
                    )
                ]),
                //Row for size L
                TableRow(children: [
                  for (var measurement in sizeL)
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          measurement,
                          style: TextStyle(fontSize: 2.sw),
                        ),
                      ),
                    )
                ]),
                //Row for size XL
                TableRow(children: [
                  for (var measurement in sizeXL)
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          measurement,
                          style: TextStyle(fontSize: 2.sw),
                        ),
                      ),
                    )
                ]),
                //Row for size XXL
                TableRow(children: [
                  for (var measurement in sizeXXL)
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          measurement,
                          style: TextStyle(fontSize: 2.sw),
                        ),
                      ),
                    )
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
