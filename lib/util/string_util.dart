/// 字符串工具类
class StringUtil {
  ///字符串除空化
  static String  toNoNull(String str){
    if(str == null || "null"==str){
      str = "";
    }
      return str;
  }

  /// 判断字符串是否为空
  static bool isEmpay(String str){
    if(str == null || str.length == 0){
      return true;
    } else {
      return false;
    }
  }
}
