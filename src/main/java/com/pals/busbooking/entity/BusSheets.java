package com.pals.busbooking.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "busseats")
public class BusSheets {
	@Id
	@Column(name = "seatid")
	private String seatId;
	@Column(name = "available_date")
	private Date availableDate;
	@Column(columnDefinition = "boolean default false")
	private boolean s1;
	@Column(columnDefinition = "boolean default false")
	private boolean s2;
	@Column(columnDefinition = "boolean default false")
	private boolean s3;
	@Column(columnDefinition = "boolean default false")
	private boolean s4;
	@Column(columnDefinition = "boolean default false")
	private boolean s5;
	@Column(columnDefinition = "boolean default false")
	private boolean s6;
	@Column(columnDefinition = "boolean default false")
	private boolean s7;
	@Column(columnDefinition = "boolean default false")
	private boolean s8;
	@Column(columnDefinition = "boolean default false")
	private boolean s9;
	@Column(columnDefinition = "boolean default false")
	private boolean s10;
	@Column(columnDefinition = "boolean default false")
	private boolean s11;
	@Column(columnDefinition = "boolean default false")
	private boolean s12;
	@Column(columnDefinition = "boolean default false")
	private boolean s13;
	@Column(columnDefinition = "boolean default false")
	private boolean s14;
	@Column(columnDefinition = "boolean default false")
	private boolean s15;
	@Column(columnDefinition = "boolean default false")
	private boolean s16;
	@Column(columnDefinition = "boolean default false")
	private boolean s17;
	@Column(columnDefinition = "boolean default false")
	private boolean s18;
	@Column(columnDefinition = "boolean default false")
	private boolean s19;
	@Column(columnDefinition = "boolean default false")
	private boolean s20;
	@Column(columnDefinition = "boolean default false")
	private boolean s21;
	@Column(columnDefinition = "boolean default false")
	private boolean s22;
	@Column(columnDefinition = "boolean default false")
	private boolean s23;
	@Column(columnDefinition = "boolean default false")
	private boolean s24;
	@Column(columnDefinition = "boolean default false")
	private boolean s25;
	@Column(columnDefinition = "boolean default false")
	private boolean s26;
	@Column(columnDefinition = "boolean default false")
	private boolean s27;
	@Column(columnDefinition = "boolean default false")
	private boolean s28;
	@Column(columnDefinition = "boolean default false")
	private boolean s29;
	@Column(columnDefinition = "boolean default false")
	private boolean s30;
	@Column(columnDefinition = "boolean default false")
	private boolean s31;
	@Column(columnDefinition = "boolean default false")
	private boolean s32;
	@Column(columnDefinition = "boolean default false")
	private boolean s33;
	@Column(columnDefinition = "boolean default false")
	private boolean s34;
	@Column(columnDefinition = "boolean default false")
	private boolean s35;
	@Column(columnDefinition = "boolean default false")
	private boolean s36;
	@Column(columnDefinition = "boolean default false")
	private boolean s37;
	@Column(columnDefinition = "boolean default false")
	private boolean s38;
	@Column(columnDefinition = "boolean default false")
	private boolean s39;
	@Column(columnDefinition = "boolean default false")
	private boolean s40;
	@Column(columnDefinition = "boolean default false")
	private boolean s41;
	@Column(columnDefinition = "boolean default false")
	private boolean s42;
	@Column(columnDefinition = "boolean default false")
	private boolean s43;
	@Column(columnDefinition = "boolean default false")
	private boolean s44;
	@Column(columnDefinition = "boolean default false")
	private boolean s45;
	public BusSheets(String seatId, Date availableDate) {
		super();
		this.seatId = seatId;
		this.availableDate = availableDate;
	}
	
	public BusSheets() {
		super();
	}

	public String getSeatId() {
		return seatId;
	}
	public void setSeatId(String seatId) {
		this.seatId = seatId;
	}
	public Date getAvailableDate() {
		return availableDate;
	}
	public void setAvailableDate(Date availableDate) {
		this.availableDate = availableDate;
	}
	public boolean isS1() {
		return s1;
	}
	public void setS1(boolean s1) {
		this.s1 = s1;
	}
	public boolean isS2() {
		return s2;
	}
	public void setS2(boolean s2) {
		this.s2 = s2;
	}
	public boolean isS3() {
		return s3;
	}
	public void setS3(boolean s3) {
		this.s3 = s3;
	}
	public boolean isS4() {
		return s4;
	}
	public void setS4(boolean s4) {
		this.s4 = s4;
	}
	public boolean isS5() {
		return s5;
	}
	public void setS5(boolean s5) {
		this.s5 = s5;
	}
	public boolean isS6() {
		return s6;
	}
	public void setS6(boolean s6) {
		this.s6 = s6;
	}
	public boolean isS7() {
		return s7;
	}
	public void setS7(boolean s7) {
		this.s7 = s7;
	}
	public boolean isS8() {
		return s8;
	}
	public void setS8(boolean s8) {
		this.s8 = s8;
	}
	public boolean isS9() {
		return s9;
	}
	public void setS9(boolean s9) {
		this.s9 = s9;
	}
	public boolean isS10() {
		return s10;
	}
	public void setS10(boolean s10) {
		this.s10 = s10;
	}
	public boolean isS11() {
		return s11;
	}
	public void setS11(boolean s11) {
		this.s11 = s11;
	}
	public boolean isS12() {
		return s12;
	}
	public void setS12(boolean s12) {
		this.s12 = s12;
	}
	public boolean isS13() {
		return s13;
	}
	public void setS13(boolean s13) {
		this.s13 = s13;
	}
	public boolean isS14() {
		return s14;
	}
	public void setS14(boolean s14) {
		this.s14 = s14;
	}
	public boolean isS15() {
		return s15;
	}
	public void setS15(boolean s15) {
		this.s15 = s15;
	}
	public boolean isS16() {
		return s16;
	}
	public void setS16(boolean s16) {
		this.s16 = s16;
	}
	public boolean isS17() {
		return s17;
	}
	public void setS17(boolean s17) {
		this.s17 = s17;
	}
	public boolean isS18() {
		return s18;
	}
	public void setS18(boolean s18) {
		this.s18 = s18;
	}
	public boolean isS19() {
		return s19;
	}
	public void setS19(boolean s19) {
		this.s19 = s19;
	}
	public boolean isS20() {
		return s20;
	}
	public void setS20(boolean s20) {
		this.s20 = s20;
	}
	public boolean isS21() {
		return s21;
	}
	public void setS21(boolean s21) {
		this.s21 = s21;
	}
	public boolean isS22() {
		return s22;
	}
	public void setS22(boolean s22) {
		this.s22 = s22;
	}
	public boolean isS23() {
		return s23;
	}
	public void setS23(boolean s23) {
		this.s23 = s23;
	}
	public boolean isS24() {
		return s24;
	}
	public void setS24(boolean s24) {
		this.s24 = s24;
	}
	public boolean isS25() {
		return s25;
	}
	public void setS25(boolean s25) {
		this.s25 = s25;
	}
	public boolean isS26() {
		return s26;
	}
	public void setS26(boolean s26) {
		this.s26 = s26;
	}
	public boolean isS27() {
		return s27;
	}
	public void setS27(boolean s27) {
		this.s27 = s27;
	}
	public boolean isS28() {
		return s28;
	}
	public void setS28(boolean s28) {
		this.s28 = s28;
	}
	public boolean isS29() {
		return s29;
	}
	public void setS29(boolean s29) {
		this.s29 = s29;
	}
	public boolean isS30() {
		return s30;
	}
	public void setS30(boolean s30) {
		this.s30 = s30;
	}
	public boolean isS31() {
		return s31;
	}
	public void setS31(boolean s31) {
		this.s31 = s31;
	}
	public boolean isS32() {
		return s32;
	}
	public void setS32(boolean s32) {
		this.s32 = s32;
	}
	public boolean isS33() {
		return s33;
	}
	public void setS33(boolean s33) {
		this.s33 = s33;
	}
	public boolean isS34() {
		return s34;
	}
	public void setS34(boolean s34) {
		this.s34 = s34;
	}
	public boolean isS35() {
		return s35;
	}
	public void setS35(boolean s35) {
		this.s35 = s35;
	}
	public boolean isS36() {
		return s36;
	}
	public void setS36(boolean s36) {
		this.s36 = s36;
	}
	public boolean isS37() {
		return s37;
	}
	public void setS37(boolean s37) {
		this.s37 = s37;
	}
	public boolean isS38() {
		return s38;
	}
	public void setS38(boolean s38) {
		this.s38 = s38;
	}
	public boolean isS39() {
		return s39;
	}
	public void setS39(boolean s39) {
		this.s39 = s39;
	}
	public boolean isS40() {
		return s40;
	}
	public void setS40(boolean s40) {
		this.s40 = s40;
	}
	public boolean isS41() {
		return s41;
	}
	public void setS41(boolean s41) {
		this.s41 = s41;
	}
	public boolean isS42() {
		return s42;
	}
	public void setS42(boolean s42) {
		this.s42 = s42;
	}
	public boolean isS43() {
		return s43;
	}
	public void setS43(boolean s43) {
		this.s43 = s43;
	}
	public boolean isS44() {
		return s44;
	}
	public void setS44(boolean s44) {
		this.s44 = s44;
	}
	public boolean isS45() {
		return s45;
	}
	public void setS45(boolean s45) {
		this.s45 = s45;
	}
	@Override
	public String toString() {
		return "BusSheets [seatId=" + seatId + ", availableDate=" + availableDate + ", s1=" + s1 + ", s2=" + s2
				+ ", s3=" + s3 + ", s4=" + s4 + ", s5=" + s5 + ", s6=" + s6 + ", s7=" + s7 + ", s8=" + s8 + ", s9=" + s9
				+ ", s10=" + s10 + ", s11=" + s11 + ", s12=" + s12 + ", s13=" + s13 + ", s14=" + s14 + ", s15=" + s15
				+ ", s16=" + s16 + ", s17=" + s17 + ", s18=" + s18 + ", s19=" + s19 + ", s20=" + s20 + ", s21=" + s21
				+ ", s22=" + s22 + ", s23=" + s23 + ", s24=" + s24 + ", s25=" + s25 + ", s26=" + s26 + ", s27=" + s27
				+ ", s28=" + s28 + ", s29=" + s29 + ", s30=" + s30 + ", s31=" + s31 + ", s32=" + s32 + ", s33=" + s33
				+ ", s34=" + s34 + ", s35=" + s35 + ", s36=" + s36 + ", s37=" + s37 + ", s38=" + s38 + ", s39=" + s39
				+ ", s40=" + s40 + ", s41=" + s41 + ", s42=" + s42 + ", s43=" + s43 + ", s44=" + s44 + ", s45=" + s45
				+ "]";
	}
	
}
