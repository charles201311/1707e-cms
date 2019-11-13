package com.bw.cms.utils;

public class PageUtil {

	/**
	 * 
	 * @param page 当前第几页
	 * @param pages 总页数
	 * @param url 调用的url  list?name=12&sex=男&page=3
	 * 	 * @param pageSize 显示多少页
	 * @return
	 */
	  public static String page(int page, int pages, String url, int pageSize)
      {
          if (page< 1) page= 1;
          if (page> pages) page= pages;
          // 根据url是否参数,改变拼接的符合
          String flag = url.indexOf("?") != -1 ? "&" : "?";
          
          
          StringBuilder sb = new StringBuilder();
          
          sb.append("<nav aria-label='Page navigation example'>");
          //String.format("%1$s%2$s", "abc","123");
          
          //'url?page=1'   ,url, flag,"page" ,page- 1 < 1 ? 1 : page- 1)
          
          
          sb.append(String.format("<ul class='pagination'><li class='page-item'><a class='page-link' "
          		+ " href='javascript:void(0)' "
          		+ "data='%1$s%2$s%3$s=%4$s' aria-label='Previous'> "
          		+ " <span aria-hidden='true'>&laquo;</span></a></li>" 
          		,url, flag,"page" ,page- 1 < 1 ? 1 : page- 1));
          //设开始页为1
          int beginPage = 1;
          //中间页为 pageSize/2
          int midPage = pageSize / 2;
          if (page> midPage)
          {
              beginPage = page- midPage;
          }
          for (int i = 0; i < pageSize; i++)
          {
        	  //当前页不加链接  data="url?username=lucy&page=2"
              sb.append(String.format("<li class='page-item'><a  class='page-link'  href='javascript:void(0)' data='%1$s%2$s%3$s=%4$s' >%4$s</a></li>" ,url, flag,"page" ,beginPage + i));
              //如果后面的页数大于总页数，退出循环
              if (beginPage + i >= pages)
              {
                  break;
              }
          }
          sb.append(String.format("<li class='page-item'><a  class='page-link' href='javascript:void(0)' data='%1$s%2$s%3$s=%4$s' aria-label='Next' ><span aria-hidden='true'>&raquo;</span></a></li>" ,url, flag,"page" ,page+ 1 >= pages ? pages : page+ 1));
          sb.append("</ul></nav>");
          return sb.toString();
      }
}
