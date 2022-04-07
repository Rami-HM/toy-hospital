package com.spring.pds.vo;

public class PdsVo {	
	// 게시물 (board)
	private int     brd_idx;	
	private String  brd_title;
	private String  brd_conts;
	private String  brd_writer;
	private String  brd_regdate;
	private int     readcount;

	// 게시물 (답글)
	private int     brd_bnum;
	private int     brd_lvl;
	private int     brd_step;
	private int     brd_nref;
	private int     brd_delnum;
	
	// 메뉴 관련
	private String  sub_id;
	private String  sub_name;
	private int     sub_seq;
	
	private int     filescount;
	
	// 페이징 관련 정보
	private int     nowpage;         // 현재 페이지정보
	private int     prevnowpage;     // 이전 10개 클릭시 적용되는 nowpage
	private int     nextnowpage;     // 다음 10개 클릭시 적용되는 nowpage

	private int     totalcount;       // 조회된 전체 Data Row 수
	private int     totalpagecount;   // 화면에 보여줄 페이지 수 : 전체 페이지 수
	
//	pagestartnum  	                       pageendnum;   pagegrpnum;    
	//   1        2  3  4 5   6  7  8  9    10 >            1
	// < 11      12 13 14 15 16 17 18 19    20 >            2
	// < 21      22 23 24 25 26                             3
		
	private int     pagestartnum;     // 페이지 시작 번호
	private int     pageendnum;       // 페이지 끝 번호
	private int     pagegrpnum;       // 페이지 그룹 숫자
	
	private int     pagecount;        // 한페이지에 보여줄 자료라인수 
	
	private boolean  isshowpageprev;  
	private boolean  isshowpagenext;
	
	// Constructor
	public PdsVo() {}
	public PdsVo(int brd_idx, String brd_title, String brd_conts, String brd_writer, String brd_regdate, int readcount,
			int brd_bnum, int brd_lvl, int brd_step, int brd_nref, int brd_delnum, String sub_id, String sub_name,
			int sub_seq, int filescount, int nowpage, int prevnowpage, int nextnowpage, int totalcount,
			int totalpagecount, int pagestartnum, int pageendnum, int pagegrpnum, int pagecount, boolean isshowpageprev,
			boolean isshowpagenext) {
		this.brd_idx = brd_idx;
		this.brd_title = brd_title;
		this.brd_conts = brd_conts;
		this.brd_writer = brd_writer;
		this.brd_regdate = brd_regdate;
		this.readcount = readcount;
		this.brd_bnum = brd_bnum;
		this.brd_lvl = brd_lvl;
		this.brd_step = brd_step;
		this.brd_nref = brd_nref;
		this.brd_delnum = brd_delnum;
		this.sub_id = sub_id;
		this.sub_name = sub_name;
		this.sub_seq = sub_seq;
		this.filescount = filescount;
		this.nowpage = nowpage;
		this.prevnowpage = prevnowpage;
		this.nextnowpage = nextnowpage;
		this.totalcount = totalcount;
		this.totalpagecount = totalpagecount;
		this.pagestartnum = pagestartnum;
		this.pageendnum = pageendnum;
		this.pagegrpnum = pagegrpnum;
		this.pagecount = pagecount;
		this.isshowpageprev = isshowpageprev;
		this.isshowpagenext = isshowpagenext;
	}
	
	// Getter / Setter
	public int getBrd_idx() {
		return brd_idx;
	}
	public void setBrd_idx(int brd_idx) {
		this.brd_idx = brd_idx;
	}
	public String getBrd_title() {
		return brd_title;
	}
	public void setBrd_title(String brd_title) {
		this.brd_title = brd_title;
	}
	public String getBrd_conts() {
		return brd_conts;
	}
	public void setBrd_conts(String brd_conts) {
		this.brd_conts = brd_conts;
	}
	public String getBrd_writer() {
		return brd_writer;
	}
	public void setBrd_writer(String brd_writer) {
		this.brd_writer = brd_writer;
	}
	public String getBrd_regdate() {
		return brd_regdate;
	}
	public void setBrd_regdate(String brd_regdate) {
		this.brd_regdate = brd_regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getBrd_bnum() {
		return brd_bnum;
	}
	public void setBrd_bnum(int brd_bnum) {
		this.brd_bnum = brd_bnum;
	}
	public int getBrd_lvl() {
		return brd_lvl;
	}
	public void setBrd_lvl(int brd_lvl) {
		this.brd_lvl = brd_lvl;
	}
	public int getBrd_step() {
		return brd_step;
	}
	public void setBrd_step(int brd_step) {
		this.brd_step = brd_step;
	}
	public int getBrd_nref() {
		return brd_nref;
	}
	public void setBrd_nref(int brd_nref) {
		this.brd_nref = brd_nref;
	}
	public int getBrd_delnum() {
		return brd_delnum;
	}
	public void setBrd_delnum(int brd_delnum) {
		this.brd_delnum = brd_delnum;
	}
	public String getSub_id() {
		return sub_id;
	}
	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public int getSub_seq() {
		return sub_seq;
	}
	public void setSub_seq(int sub_seq) {
		this.sub_seq = sub_seq;
	}
	public int getFilescount() {
		return filescount;
	}
	public void setFilescount(int filescount) {
		this.filescount = filescount;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public int getPrevnowpage() {
		return prevnowpage;
	}
	public void setPrevnowpage(int prevnowpage) {
		this.prevnowpage = prevnowpage;
	}
	public int getNextnowpage() {
		return nextnowpage;
	}
	public void setNextnowpage(int nextnowpage) {
		this.nextnowpage = nextnowpage;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getTotalpagecount() {
		return totalpagecount;
	}
	public void setTotalpagecount(int totalpagecount) {
		this.totalpagecount = totalpagecount;
	}
	public int getPagestartnum() {
		return pagestartnum;
	}
	public void setPagestartnum(int pagestartnum) {
		this.pagestartnum = pagestartnum;
	}
	public int getPageendnum() {
		return pageendnum;
	}
	public void setPageendnum(int pageendnum) {
		this.pageendnum = pageendnum;
	}
	public int getPagegrpnum() {
		return pagegrpnum;
	}
	public void setPagegrpnum(int pagegrpnum) {
		this.pagegrpnum = pagegrpnum;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public boolean isIsshowpageprev() {
		return isshowpageprev;
	}
	public void setIsshowpageprev(boolean isshowpageprev) {
		this.isshowpageprev = isshowpageprev;
	}
	public boolean isIsshowpagenext() {
		return isshowpagenext;
	}
	public void setIsshowpagenext(boolean isshowpagenext) {
		this.isshowpagenext = isshowpagenext;
	}
	
	// toString
	@Override
	public String toString() {
		return "PdsVo [brd_idx=" + brd_idx + ", brd_title=" + brd_title + ", brd_conts=" + brd_conts + ", brd_writer="
				+ brd_writer + ", brd_regdate=" + brd_regdate + ", readcount=" + readcount + ", brd_bnum=" + brd_bnum
				+ ", brd_lvl=" + brd_lvl + ", brd_step=" + brd_step + ", brd_nref=" + brd_nref + ", brd_delnum="
				+ brd_delnum + ", sub_id=" + sub_id + ", sub_name=" + sub_name + ", sub_seq=" + sub_seq
				+ ", filescount=" + filescount + ", nowpage=" + nowpage + ", prevnowpage=" + prevnowpage
				+ ", nextnowpage=" + nextnowpage + ", totalcount=" + totalcount + ", totalpagecount=" + totalpagecount
				+ ", pagestartnum=" + pagestartnum + ", pageendnum=" + pageendnum + ", pagegrpnum=" + pagegrpnum
				+ ", pagecount=" + pagecount + ", isshowpageprev=" + isshowpageprev + ", isshowpagenext="
				+ isshowpagenext + "]";
	}
}
