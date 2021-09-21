
abstract class SocialStateApp{}
class InitialAppState extends SocialStateApp{}
class SocialLoginSucState extends SocialStateApp{
  final String? uId;

  SocialLoginSucState(this.uId);
}
class SocialLoginEroState extends SocialStateApp{
  final String error;
  SocialLoginEroState(this.error);
}
class SocialRegisterSucState extends SocialStateApp{
  final String? uId;

  SocialRegisterSucState(this.uId);
}
class SocialRegisterEroState extends SocialStateApp{
  final String error;
  SocialRegisterEroState(this.error);
}
class BottomNavBarAppState extends SocialStateApp{}
class BottomNavBarAddPostAppState extends SocialStateApp{}
class GetUserDataSuccessAppState extends SocialStateApp{}
class GetUserDataErrorAppState extends SocialStateApp{}
class VisibilityAppState extends SocialStateApp{}
class ModelDataAppState extends SocialStateApp{}
class LoadingHomeDataAppState extends SocialStateApp{}
class SuccessHomeDataAppState extends SocialStateApp{}
class ErrorHomeDataAppState extends SocialStateApp{}
class SuccessCategoriesModelAppState extends SocialStateApp{}
class ErrorCategoriesModelAppState extends SocialStateApp{}
class SuccessFavoritesModelAppState extends SocialStateApp{}
class SuccessChangerFavoritesModelAppState extends SocialStateApp{}
class ErrorFavoritesModelAppState extends SocialStateApp{}
class SuccessGetFavoritesModelScreenAppState extends SocialStateApp{}
class ErrorGetFavoritesModelScreenAppState extends SocialStateApp{}
class LoadingGetFavoritesModelScreenAppState extends SocialStateApp{}
class SuccessUserSettingScreenAppState extends SocialStateApp{}
class ErrorUserSettingScreenAppState extends SocialStateApp{}
class LoadingUserSettingScreenAppState extends SocialStateApp{}
class ErrorUserUpDateSettingScreenAppState extends SocialStateApp{}
class SuccessUserUpDateSettingScreenAppState extends SocialStateApp{}
class LoadingUserUpDateSettingScreenAppState extends SocialStateApp{}
class SuccessImagePickedScreenAppState extends SocialStateApp{}
class ErrorImagePickedScreenAppState extends SocialStateApp{}
class SuccessCoverPickedScreenAppState extends SocialStateApp{}
class ErrorCoverPickedScreenAppState extends SocialStateApp{}
class CreateUsersSuccessEmit extends SocialStateApp{}
class CreateUsersErrorEmit extends SocialStateApp{
  final String error;
  CreateUsersErrorEmit(this.error);
}


