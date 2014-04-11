/**
 * 
 */
package actions.backend;

import bl.beans.SourceCodeBean;
import vo.table.TableInitVo;
import vo.table.TableQueryVo;
import webapps.WebappsConstants;
import bl.beans.VolunteerBean;

import java.util.List;

/**
 * @author gudong
 * @since $Date:2014-02-10$
 */
public class BackendVolunteerVerifyAction extends BackendVolunteerAction {
    @Override
    public String getTableTitle() {
        return "<ul class=\"breadcrumb\"><li>志愿者管理</li><li class=\"active\">审核</li></ul>";
    }


  @Override
  public String getActionPrex() {
    return getRequest().getContextPath() + "/backend/volunteerVerify";
  }

  @Override
  public String getCustomJs() {
    return getRequest().getContextPath() + "/js/volunteerVerify.js";
  }

  @Override
  public TableQueryVo getModel() {
    // 0=已注册、1=已审核、2=已面试、3=正在服务期、4=已注销
    TableQueryVo model = super.getModel();
    model.getFilter().put("status", VolunteerBean.REGISTERED);
    return model;
  }

  @Override
  public TableInitVo getTableInit() {
    TableInitVo init = super.getTableInit();
    init.setDisableTools(true);
    return init;
  }

  /**
   * 
   * @return
   */
  public String verify() {
    this.listSource = (List<SourceCodeBean>) SOURBUS.getAllLeaves().getResponseData();
    VolunteerBean volunteer = (VolunteerBean) getBusiness().getLeaf(getId()).getResponseData();
    setVolunteer(volunteer);
    return SUCCESS;
  }
}
