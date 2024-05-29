const base = {
    get() {
                return {
            url : "http://localhost:8080/ssms0i0l/",
            name: "ssms0i0l",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/ssms0i0l/front/index.html'
        };
            },
    getProjectName(){
        return {
            projectName: "基于SSM的课程智能组卷系统"
        } 
    }
}
export default base
