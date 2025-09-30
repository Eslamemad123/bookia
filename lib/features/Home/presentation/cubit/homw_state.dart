class Home_States {}

class HomeInitailState extends Home_States {}

class HomeLoadingState extends Home_States {}

class HomeErrorState extends Home_States {}

class WishListCartSuccess extends Home_States {
  String message;
  WishListCartSuccess(this.message);
}

class HomeSuccessState extends Home_States {}
