<template>
        <vue-ueditor-wrap :style="{ height: `${record.options.height}px` }" v-model="content" :editor-id="CryptoKey" :ref="CryptoKey" :id="CryptoKey"
            :class="{ chinesization: record.options.chinesization }" :disabled="record.options.disabled || parentDisabled"
            :editorDependencies="['ueditor.config.js', 'ueditor.all.js']"
            :config="UeditorConfig"></vue-ueditor-wrap>
</template>
<script>
// 富文本编辑器
import VueUeditorWrap from 'vue-ueditor-wrap'
import { getToken } from "@/utils/auth";
import {nanoid} from 'nanoid'

export default {
    name: "UEditor",
    props: ["value", "record", "parentDisabled"],
    components: { VueUeditorWrap },
    data() {
        return {
            content: this.value,
            UeditorConfig: {
                // 初始容器高度
                initialFrameHeight: 400,
                // 初始容器宽度
                initialFrameWidth: '100%',
                // 编辑器后端服务接口，参考后端规范 https://open-doc.modstart.com/ueditor-plus/backend.html
                serverUrl: process.env.VUE_APP_BASE_API + '/UEditor',
                headers: {
                    Authorization: "Bearer " + getToken()
                },
                // 配置 UEditorPlus 的静态资源根路径，可以是 CDN 的静态资源地址
                UEDITOR_HOME_URL: '/admin/UEditor/',
            }
        }
    },
    computed: {
        CryptoKey(){
            return nanoid();
        }
    },
    mounted(){
        console.log("唯一uid",this.CryptoKey);
    },
    watch:{
        value(newVal,oldVal){
            console.log("内容变化了",newVal)
            this.content = newVal;
        },
        content(newVal,oldVal){
            this.$emit("change", newVal);
        }
    }
}
</script>

