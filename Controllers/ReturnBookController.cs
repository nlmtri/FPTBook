using lib.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace lib.Controllers
{
    public class ReturnBookController : Controller
    {
        libEntities db = new libEntities();
        // GET: ReturnBook
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetMid(int mid)
        {
            var memberid = (from s in db.issuebooks
                            where s.m_id == mid
                            select new
                            {
                                IssueDate = s.issuedate,
                                ReturnDate = s.returndate,
                                Memberid = s.m_id,
                                BookName = s.book_id,
                                ElapsedDays = SqlFunctions.DateDiff("day", s.returndate, DateTime.Now)
                            }).ToArray();

            return Json(memberid, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Save(returnbook returns)
        {
            if (ModelState.IsValid)
            {
                db.returnbooks.Add(returns);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(returns);
        }
    }
}