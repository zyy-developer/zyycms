package com.zyy.system.fixed.dict;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.function.BiConsumer;
import java.util.function.Function;
import java.util.regex.Pattern;

import com.zyy.common.core.domain.entity.SysDictData;
import com.zyy.common.utils.StringUtils;
import com.zyy.common.utils.spring.SpringUtils;
import com.zyy.system.fixed.FixedDictType;
import com.zyy.system.service.ISysDictDataService;
import com.zyy.system.service.ISysDictTypeService;
import org.springframework.stereotype.Component;

//import com.chestnut.common.utils.SpringUtils;
//import com.chestnut.common.utils.StringUtils;
//import com.chestnut.system.domain.SysDictData;
//import com.chestnut.system.fixed.FixedDictType;
//import com.chestnut.system.service.ISysDictTypeService;

/**
 * 密码校验规则，允许后台添加扩展，备注字段填写对应正则表达式即可
 */
@Component(FixedDictType.BEAN_PREFIX + PasswordRule.TYPE)
public class PasswordRule extends FixedDictType {

	public static final String TYPE = "sys_security_password_rule";

	public static final String NONE = "NONE"; // 无要求

	public static final String LETTER_NUMBER = "LETTER_NUMBER"; // 必须包含字母、数字

	public static final String REGEX_LETTER_NUMBER = "^(?=.*\\d+)(?=.*[A-Za-z]+)[A-Za-z\\d!@#$%^&*?()\\[\\]{}<>:;,.'\"~·+=_-]+$";

	public static final String UPPER_LOW_LETTER_NUMBER = "UPPER_LOW_LETTER_NUMBER"; // 必须包含大小写字母、数字

	public static final String REGEX_UPPER_LOW_LETTER_NUMBER = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d!@#$%^&*?()\\[\\]{}<>:;,.'\"~·+=_-]+$";

	public static final String LETTER_NUMBER_SPECIAL = "LETTER_NUMBER_SPECIAL"; // 必须包含字母、数字、特殊字符

	public static final String REGEX_LETTER_NUMBER_SPECIAL = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*?()\\[\\]{}<>:;,.'\"~·+=_-])[A-Za-z\\d!@#$%^&*?()\\[\\]{}<>:;,.'\"~·+=_-]+$";

	public static final String UPPER_LOW_LETTER_NUMBER_SPECIAL = "UPPER_LOW_LETTER_NUMBER_SPECIAL"; // 必须包含大小写字母、数字、特殊字符

	public static final String REGEX_UPPER_LOW_LETTER_NUMBER_SPECIAL = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*?()\\[\\]{}<>:;,.'\"~·+=_-])[A-Za-z\\d!@#$%^&*?()\\[\\]{}<>:;,.'\"~·+=_-]+$";

	private static final ISysDictTypeService dictTypeService = SpringUtils.getBean(ISysDictTypeService.class);

	private static final ISysDictDataService dictDataService = SpringUtils.getBean(ISysDictDataService.class);

	private static final Map<String, Pattern> PatternMap = Map.of(
			LETTER_NUMBER, Pattern.compile(REGEX_LETTER_NUMBER),
			UPPER_LOW_LETTER_NUMBER, Pattern.compile(REGEX_UPPER_LOW_LETTER_NUMBER),
			LETTER_NUMBER_SPECIAL, Pattern.compile(REGEX_LETTER_NUMBER_SPECIAL),
			UPPER_LOW_LETTER_NUMBER_SPECIAL, Pattern.compile(REGEX_UPPER_LOW_LETTER_NUMBER_SPECIAL));

	public PasswordRule() {
		super(TYPE, "{DICT." + TYPE + "}", true);
		super.addDictData("{DICT." + TYPE + "." + NONE + "}", NONE, 1, "");
		super.addDictData("{DICT." + TYPE + "." + LETTER_NUMBER + "}", LETTER_NUMBER, 2, REGEX_LETTER_NUMBER);
		super.addDictData("{DICT." + TYPE + "." + UPPER_LOW_LETTER_NUMBER + "}", UPPER_LOW_LETTER_NUMBER, 3, REGEX_UPPER_LOW_LETTER_NUMBER);
		super.addDictData("{DICT." + TYPE + "." + LETTER_NUMBER_SPECIAL + "}", LETTER_NUMBER_SPECIAL, 4, REGEX_LETTER_NUMBER_SPECIAL);
		super.addDictData("{DICT." + TYPE + "." + UPPER_LOW_LETTER_NUMBER_SPECIAL + "}", UPPER_LOW_LETTER_NUMBER_SPECIAL, 5, REGEX_UPPER_LOW_LETTER_NUMBER_SPECIAL);
	}

//	public static String getRuleRegex(String rule) {
//		Optional<SysDictData> opt = dictTypeService.optDictData(TYPE, rule);
//		return opt.isPresent() ? opt.get().getRemark() : StringUtils.EMPTY;
//	}

	public static Pattern getRulePatter(String rule) {
		Pattern pattern = PatternMap.get(rule);
		if (Objects.isNull(pattern)) {
//			Optional<SysDictData> opt = dictTypeService.optDictData(TYPE, rule);
			SysDictData sysDictData = new SysDictData();
			sysDictData.setDictType(TYPE);
			sysDictData.setDictValue(rule);
			SysDictData opt = dictDataService.selectDictDataByTypeAndValue(sysDictData);

			if (opt!=null && StringUtils.isNotEmpty(opt.getRemark())) {
				pattern = Pattern.compile(opt.getRemark());
				PatternMap.put(rule, pattern);
			}
		}
		return pattern;
	}

	public static boolean match(String rule, String password) {
		Pattern pattern = getRulePatter(rule);
		if (Objects.isNull(pattern)) {
			return true;
		}
		return pattern.matcher(password).matches();
	}
}
