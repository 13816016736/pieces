package com.pieces.dao.enums;

/**
 * Created by xiao on 2016/11/16.
 */
public enum QualificationTypeEnum {
    //1营业执照、2GSP/GMP证书、3生产/经营许可证,4组织机构代码证、5税务登记证,6医疗机构执业许可证

    LIENSE_1(1, "营业执照"),
    LIENSE_2(2, "GSP/GMP证书"),
    LIENSE_3(3, "生产/经营许可证"),
    LIENSE_4(4, "组织机构代码证"),
    LIENSE_5(5, "税务登记证"),
    LIENSE_6(6, "医疗机构执业许可证"),
    LIENSE_7(7, "采购人员授权委托书"),
    LIENSE_8(8, "印章备案"),
    LIENSE_9(9, "开票信息"),
    LIENSE_10(10, "采购人员身份证正面"),
    LIENSE_11(11, "采购人员身份证反面");





    private Integer value;

    private String text;


    QualificationTypeEnum(Integer value, String text) {
        this.value = value;
        this.text = text;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    /**
     * 通过ID来查询属性名称
     *
     * @param id
     * @return
     */
    public static String findByValue(Integer id) {
        for (QualificationTypeEnum qualificationTypeEnum : QualificationTypeEnum.values()) {
            if (qualificationTypeEnum.getValue().equals(id)) {
                return qualificationTypeEnum.getText();
            }
        }
        return null;
    }




}
