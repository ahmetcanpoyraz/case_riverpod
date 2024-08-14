part of 'result_view.dart';

class ResultListItem extends StatelessWidget {
  const ResultListItem({
    super.key,
    required this.searchState,
    required this.index,
  });

  final SearchState searchState;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blueGrey, width: 2.w),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          children: [
            CustomCachedNetworkImage(
                imageUrl: searchState.news?.articles?[index].urlToImage ?? ""),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    searchState.news?.articles?[index].title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    searchState.news?.articles?[index].description ?? "",
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
