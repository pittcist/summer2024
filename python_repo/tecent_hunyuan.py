import json
import types
from tencentcloud.common import credential
from tencentcloud.common.profile.client_profile import ClientProfile
from tencentcloud.common.profile.http_profile import HttpProfile
from tencentcloud.common.exception.tencent_cloud_sdk_exception import TencentCloudSDKException
from tencentcloud.hunyuan.v20230901 import hunyuan_client, models

# Documentation： https://cloud.tencent.com.cn/document/api/1729/101849
# preinstall package tencentcloud-sdk-python

def hunyuan_chat_message(message):
    try:
        cred = credential.Credential("", "")
        # 实例化一个http选项，可选的，没有特殊需求可以跳过
        httpProfile = HttpProfile()
        httpProfile.endpoint = "hunyuan.tencentcloudapi.com"

        # 实例化一个client选项，可选的，没有特殊需求可以跳过
        clientProfile = ClientProfile()
        clientProfile.httpProfile = httpProfile
        # 实例化要请求产品的client对象,clientProfile是可选的
        client = hunyuan_client.HunyuanClient(cred, "", clientProfile)

        # 实例化一个请求对象,每个接口都会对应一个request对象
        req = models.ChatCompletionsRequest()
        params = {
            "Model": "hunyuan-lite",
            "Messages": [
                {
                    "Role": "user",
                    "Content": message
                }
            ]
        }
        req.from_json_string(json.dumps(params))

        # 返回的resp是一个ChatCompletionsResponse的实例，与请求对象对应
        resp = client.ChatCompletions(req)
        # 输出json格式的字符串回包
        if isinstance(resp, types.GeneratorType):  # 流式响应
            for event in resp:
                print(event)
        else:  # 非流式响应
            # print(resp)

            # First level parser
            items = json.loads(str(resp))
            # for i in items:
            #     print(i)
                
            # Remove the leading and ending square bracets
            choices = str(items["Choices"]).replace("'", '"').replace('None', 'null')[1:-1]
            # print(choices)

            # Second level parser
            items = json.loads(choices)
            # for i in items:
            #     print(i)
                
            message = str(items["Message"]).replace("'", '"').replace('None', 'null')

            # print(message)

            # Third level parser
            items = json.loads(message)
            # for i in items:
            #     print(i)
                
            # print(items["Content"])
            return(items["Content"])

    except TencentCloudSDKException as err:
        print(err)


content = input("Enter a question:")
response = hunyuan_chat_message(content)
print(response)