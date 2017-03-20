package com.caijin.I000Wan.util;

/**
 * 重庆时时彩计算中奖规则
 * 
 * @author jiangneng
 * 
 */
public class BonusUtil {
	private static final String type104 = "104";
	private static final String type105 = "105";
	private static final String type106 = "106";
	private static final String type431 = "431";
	private static final String type107 = "107";
	private static final String type111 = "111";
	private static final String type124 = "124";
	private static final String type121 = "121";
	private static final String type125 = "125";
	private static final String type112 = "112";
	private static final String type113 = "113";
	private static final String type437 = "437";
	private static final String type114 = "114";
	private static final String type703 = "703";
	private static final String type426 = "426";
	private static final String type421 = "421";
	private static final String type108 = "108";
	private static final String type109 = "109";

	private static final String type110 = "110";
	private static final String type116 = "116";
	private static final String type117 = "117";
	private static final String type118 = "118";
	private static final String type433 = "433";
	private static final String type434 = "434";
	private static final String type435 = "435";
	private static final String type315 = "315";
	private static final String type316 = "316";
	private static final String type415 = "415";
	private static final String type416 = "416";
	private static final String type417 = "417";
	private static final String type418 = "418";
	private static final String type701 = "701";

	private static final String type702 = "702";
	private static final String type319 = "319";
	private static final String type304 = "304";
	private static final String type708 = "708";
	private static final String type704 = "704";
	private static final String type305 = "305";
	private static final String type432 = "432";
	private static final String type311 = "311";
	private static final String type313 = "313";
	private static final String type436 = "436";
	private static final String type314 = "314";
	private static final String type424 = "424";
	private static final String type425 = "425";

	private static final String type705 = "705";
	private static final String type706 = "706";
	private static final String type419 = "419";
	private static final String type420 = "420";
	private static final String type120 = "120";
	private static final String type119 = "119";

	/**
	 * 解析中奖号码
	 */
	public static BonusMode getBonusNumber(String openCode) {
		String[] codes = openCode.split(",");
		BonusMode mode = new BonusMode();
		mode.setUnit(codes[4]);
		mode.setDecade(codes[3]);
		mode.setHundredsplace(codes[2]);
		mode.setThousand(codes[1]);
		mode.setMyriabit(codes[0]);
		return mode;
	}

	// /**
	// * 解析中奖号码[105]-,-,2,1,8
	// */
	// public static LotteryBonusMode getLotteryHondleBonus(String openCode) {
	//
	// LotteryBonusMode lotteryBonusMode = new LotteryBonusMode();
	// lotteryBonusMode.setType(type);
	// lotteryBonusMode.setUnit(codes[4]);
	// lotteryBonusMode.setDecade(codes[3]);
	// lotteryBonusMode.setHundredsplace(codes[2]);
	// lotteryBonusMode.setThousand(codes[1]);
	// lotteryBonusMode.setMyriabit(codes[0]);
	// return lotteryBonusMode;
	// }
	public static float getLotteryHondleBonus(BonusMode mode, String openCode) {
		String type = openCode.substring(1, 4);
		String[] codes = openCode.substring(5).split(",");
		LotteryBonusMode lmode = new LotteryBonusMode();
		lmode.setType(type);
		if (lmode.getType().equals(type104)) {
			lmode.setUnit(codes[4]);
			lmode.setDecade(codes[3]);
			lmode.setHundredsplace(codes[2]);
			lmode.setThousand(codes[1]);
			lmode.setMyriabit(codes[0]);

		} else if (lmode.getType().equals(type105)) {
			lmode.setUnit(codes[4]);
			lmode.setDecade(codes[3]);
			lmode.setHundredsplace(codes[2]);
			lmode.setThousand(codes[1]);
			lmode.setMyriabit(codes[0]);
			if (lmode.getUnit().equals(mode.getUnit())
					&& lmode.getDecade().equals(mode.getDecade())
					&& lmode.getHundredsplace().equals(mode.getHundredsplace())) {
				return WFPublic.getpalyJj(type105);
			}

		} else if (lmode.getType().equals(type106)) {

		} else if (lmode.getType().equals(type107)) {

		} else if (lmode.getType().equals(type108)) {

		} else if (lmode.getType().equals(type109)) {

		} else if (lmode.getType().equals(type110)) {

		} else if (lmode.getType().equals(type111)) {

		} else if (lmode.getType().equals(type112)) {

		} else if (lmode.getType().equals(type113)) {
			lmode.setUnit(codes[4]);
			lmode.setDecade(codes[3]);
			lmode.setHundredsplace(codes[2]);
			lmode.setThousand(codes[1]);
			lmode.setMyriabit(codes[0]);
			if (lmode.getUnit().equals(mode.getUnit())
					&& lmode.getDecade().equals(mode.getDecade())
					&& lmode.getHundredsplace().equals(mode.getHundredsplace())) {
				return WFPublic.getpalyJj(type113);
			}

		} else if (lmode.getType().equals(type114)) {

		} else if (lmode.getType().equals(type116)) {

		} else if (lmode.getType().equals(type117)) {

		} else if (lmode.getType().equals(type118)) {

		} else if (lmode.getType().equals(type119)) {

			float money = 0;
			for (String code : codes) {
				if (code.indexOf(mode.getUnit()) != -1) {
					money += 6.6;
				}
				if (code.indexOf(mode.getDecade()) != -1) {
					money += 6.6;
				}
				if (code.indexOf(mode.getHundredsplace()) != -1) {
					money += 6.6;
				}
			}
			return money;
		} else if (lmode.getType().equals(type120)) {
			float money = 0;
			for (String code : codes) {
				if (code.indexOf(mode.getMyriabit()) != -1) {
					money += 6.6;
				}
				if (code.indexOf(mode.getThousand()) != -1) {
					money += 6.6;
				}
				if (code.indexOf(mode.getHundredsplace()) != -1) {
					money += 6.6;
				}
			}
			return money;

		} else if (lmode.getType().equals(type121)) {
			float money = 0;
			lmode.setUnit(codes[4]);
			lmode.setDecade(codes[3]);
			lmode.setHundredsplace(codes[2]);
			lmode.setThousand(codes[1]);
			lmode.setMyriabit(codes[0]);
			if (lmode.getUnit().indexOf(mode.getUnit()) != -1) {
				money = +18;
			}
			if (lmode.getDecade().indexOf(mode.getDecade()) != -1) {
				money = +18;
			}
			if (lmode.getHundredsplace().indexOf(mode.getHundredsplace()) != -1) {
				money = +18;
			}
			if (lmode.getThousand().indexOf(mode.getThousand()) != -1) {
				money = +18;
			}
			if (lmode.getMyriabit().indexOf(mode.getMyriabit()) != -1) {
				money = +18;
			}

			return money;

		} else if (lmode.getType().equals(type124)) {

		} else if (lmode.getType().equals(type125)) {
			lmode.setUnit(codes[4]);
			lmode.setDecade(codes[3]);
			lmode.setHundredsplace(codes[2]);
			lmode.setThousand(codes[1]);
			lmode.setMyriabit(codes[0]);
			if (lmode.getMyriabit().equals(mode.getMyriabit())
					&& lmode.getThousand().equals(mode.getThousand())
					&& lmode.getHundredsplace().equals(mode.getHundredsplace())) {
				return WFPublic.getpalyJj(type125);
			}
		} else if (lmode.getType().equals(type431)) {

		} else if (lmode.getType().equals(type437)) {

		} else if (lmode.getType().equals(type703)) {

		} else if (lmode.getType().equals(type704)) {

		} else if (lmode.getType().equals(type705)) {

		} else if (lmode.getType().equals(type706)) {

		} else if (lmode.getType().equals(type708)) {
			float money = 0;
			int hezhi = Integer.valueOf(mode.getMyriabit())
					+ Integer.valueOf(mode.getThousand())
					+ Integer.valueOf(mode.getHundredsplace());
			for (String code : codes) {
				if (Integer.valueOf(code) == hezhi) {
					money += WFPublic.getpalyJj(type708);
				}
			}

			return money;

		} else if (lmode.getType().equals(type433)) {

		} else if (lmode.getType().equals(type434)) {

		} else if (lmode.getType().equals(type435)) {

		} else if (lmode.getType().equals(type436)) {

		} else if (lmode.getType().equals(type437)) {

		} else if (lmode.getType().equals(type315)) {

		} else if (lmode.getType().equals(type316)) {

		} else if (lmode.getType().equals(type415)) {

		} else if (lmode.getType().equals(type416)) {

		} else if (lmode.getType().equals(type417)) {

		} else if (lmode.getType().equals(type418)) {

		} else if (lmode.getType().equals(type419)) {

		} else if (lmode.getType().equals(type420)) {

		} else if (lmode.getType().equals(type421)) {
			lmode.setUnit(codes[4]);
			lmode.setDecade(codes[3]);
			lmode.setHundredsplace(codes[2]);
			lmode.setThousand(codes[1]);
			lmode.setMyriabit(codes[0]);
			if (lmode.getMyriabit().equals(mode.getMyriabit())
					&& lmode.getThousand().equals(mode.getThousand())
					&& lmode.getHundredsplace().equals(mode.getHundredsplace())) {
				return WFPublic.getpalyJj(type421);
			}

		} else if (lmode.getType().equals(type426)) {

		} else if (lmode.getType().equals(type701)) {

		} else if (lmode.getType().equals(type702)) {

		} else if (lmode.getType().equals(type319)) {

		} else if (lmode.getType().equals(type304)) {

			float money = 0;
			int hezhi = Integer.valueOf(mode.getHundredsplace())
					+ Integer.valueOf(mode.getUnit())
					+ Integer.valueOf(mode.getDecade());
			for (String code : codes) {
				if (Integer.valueOf(code) == hezhi) {
					money += WFPublic.getpalyJj(type304);
				}
			}

			return money;

		} else if (lmode.getType().equals(type432)) {

		} else if (lmode.getType().equals(type311)) {

		} else if (lmode.getType().equals(type305)) {

		} else if (lmode.getType().equals(type313)) {

		} else if (lmode.getType().equals(type314)) {

		} else if (lmode.getType().equals(type424)) {

		} else if (lmode.getType().equals(type425)) {

		}
		return 0;
	}
}
