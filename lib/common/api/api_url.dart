const serverUrl =
// kDebugMode ? 'http://localhost:3000/api/v1' :
    'https://api.tyrannoapartment.com/v1';

const authUrl = '$serverUrl/auth';
const loginUrl = '$serverUrl/auth/login';
const guestSignUpUrl = '$serverUrl/auth/guest';
const checkAuthUrl = '$serverUrl/auth/check';
const checkTokenUrl = '$serverUrl/auth/token';
const refreshTokenUrl = '$serverUrl/auth/refresh';
const setFcmTokenUrl = '$serverUrl/auth/fcm';
const setGuestFcmTokenUrl = '$serverUrl/auth/guest/fcm';
const getUserInfoUrl = '$serverUrl/auth/info';
const getUserTitleUrl = '$serverUrl/auth/title';
const getUserNeedsUrl = '$serverUrl/auth/needs';

const signUpAdminUrl = '$serverUrl/auth/admin';
const adminLoginUrl = '$serverUrl/auth/admin/login';
const adminInfoUrl = '$serverUrl/auth/admin/info';
const checkAdminTokenUrl = '$serverUrl/auth/admin/token';

const emailAuthUrl = '$serverUrl/auth/emailAuth';
const checkEmailUrl = '$serverUrl/auth/checkEmail';

const needsUrl = '$serverUrl/need';
const replyUrl = '$serverUrl/need/reply';
const nlpUrl = '$serverUrl/need/create/nlp';
const needDetailUrl = '$serverUrl/need/detail';
const likeNeedUrl = '$serverUrl/need/like';

const getUserMoreNeedsUrl = '$serverUrl/need/user/needs';
const getUserMoreBrandsUrl = '$serverUrl/need/user/brands';
const adminNeedsUrl = '$serverUrl/need/admin/needs';
const adminNeedsUserUrl = '$serverUrl/need/admin/user';

const brandUrl = '$serverUrl/brand';
const brandSearchUrl = '$serverUrl/brand/search';
const likeBrandUrl = '$serverUrl/brand/like';
const brandColorUrl = '$serverUrl/brand/color';
const brandImageUrl = '$serverUrl/brand/image';
const brandWebUrl = '$serverUrl/brand/url';
const brandNameUrl = '$serverUrl/brand/name';
const brandRankUrl = '$serverUrl/brand/rank';
const brandNeedsRankUrl = '$serverUrl/brand/rank/needs';
const brandReactionRankUrl = '$serverUrl/brand/rank/reaction';
const brandRequestUrl = '$serverUrl/brand/request';
const getUserLikeBrandUrl = '$serverUrl/brand/likeBrands';

const noticeUrl = '$serverUrl/notice';
const questionUrl = '$serverUrl/notice/question';

const alertUrl = '$serverUrl/alert';
const getUserAlertUrl = '$serverUrl/alert/checkAlert';

const tutorialUrl = '$serverUrl/tutorial';
const homeUrl = '$serverUrl/home';

const resourceUrl = 'https://api.tyrannoapartment.com/v1/resource?path=';
