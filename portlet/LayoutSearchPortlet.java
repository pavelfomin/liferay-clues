package com.test;

import com.liferay.portal.kernel.portlet.LiferayPortlet;
import com.liferay.portal.model.Layout;
import com.liferay.portal.model.PortletPreferences;
import com.liferay.portal.service.LayoutLocalServiceUtil;
import com.liferay.portal.service.PortletPreferencesLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.journal.model.JournalArticle;
import com.liferay.portlet.journal.service.JournalArticleLocalServiceUtil;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.portlet.RenderRequest;

/**
 * Example of finding all of the articles used on a page inside of the Web Content portlets.
 */
public class LayoutSearchPortlet extends LiferayPortlet {

	protected void getLayouts(RenderRequest renderRequest) throws Exception {

		long groupId = PortalUtil.getScopeGroupId(renderRequest);
		List<Layout> layouts = LayoutLocalServiceUtil.getLayouts(groupId, false);

		Pattern pattern = Pattern.compile(".*<preference><name>articleId</name><value>(\\d+)</value></preference>.*");

		for (Layout layout : layouts) {

			List<PortletPreferences> portletPreferences = PortletPreferencesLocalServiceUtil.getPortletPreferencesByPlid(layout.getPlid());
			Set<String> articleIds = new HashSet<String>();
			
			for (PortletPreferences portletPreference : portletPreferences) {
				
				if (portletPreference.getPortletId().startsWith("56_INSTANCE")) {
					String config = portletPreference.getPreferences();
					Matcher matcher = pattern.matcher(config);
					if (matcher.find()) {
						String articleId = matcher.group(1);
						articleIds.add(articleId);
						JournalArticle article = JournalArticleLocalServiceUtil.getArticle(groupId, articleId);
						System.out.println(String.format("LayoutSearchPortlet.getLayouts(): layout=%s url=%s article=%s",
								layout, layout.getFriendlyURL(), article));
					}
				}
			}
			if (!articleIds.isEmpty()) {
				System.out.println(String.format("LayoutSearchPortlet.getLayouts(): articleIds=%s", articleIds));
			}
		}
	}
}
