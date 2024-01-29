import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              quantity: 5,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '라면',
              quantity: 2,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '만두',
              quantity: 4,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '마라탕',
              quantity: 10,
              hasBought: false,
              isSpicy: true,
            ),
          ],
        );

  void toggleHasBought({required String name}) {
    // state는 super contructor 값으로 무조건 초기화가 된다.
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
