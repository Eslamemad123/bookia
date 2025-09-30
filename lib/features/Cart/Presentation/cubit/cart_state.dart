abstract class Cart_State {}

class CartInatial extends Cart_State {}

class CartLoading extends Cart_State {}

class CartSuccess extends Cart_State {}

class CartError extends Cart_State {}

class CartRemoveSuccess extends Cart_State {}

class CartRemoveError extends Cart_State {}

class LoadingCheckOut extends Cart_State {}

class CheckoutSuccessState extends Cart_State {}
