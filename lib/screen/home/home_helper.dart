part of './view/home_screen.dart';

AppBar _homeAppBar(BuildContext context) => AppBar(
      title: const Text("Breakfast"),
    );

Container _searchField(
  TextEditingController controller,
  Future<void> Function(String? searchText) onChange,
) {
  return Container(
    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: const Color(0xff1D1617).withOpacity(0.11),
        blurRadius: 40,
        spreadRadius: 0.0,
      ),
    ]),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(15),
        hintText: 'Search Pancake',
        hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(ImageAsset.common.searchIcon),
        ),
        suffixIcon: SizedBox(
          width: 100,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const VerticalDivider(
                  color: Colors.black,
                  indent: 10,
                  endIndent: 10,
                  thickness: 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(ImageAsset.common.filterIcon),
                ),
              ],
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChange,
    ),
  );
}

Column _categoriesSection(BuildContext context, List<Category> categories) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'Category',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const Gap(15),
      SizedBox(
        height: 120,
        child: ListView.separated(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 20, right: 20),
          separatorBuilder: (context, index) => const SizedBox(width: 25),
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              decoration: BoxDecoration(
                color: categories[index].bgColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        categories[index].icon,
                      ),
                    ),
                  ),
                  Text(
                    categories[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )
    ],
  );
}
