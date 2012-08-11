$ ->
  load_comments()
  false

load_comments = ->
  $.ajax(
    type: "GET"
    url: "blog"
  ).done((comments) ->
    for comment in comments
      render_comment(comment)
    false
  )
  false

render_comment = (comment) ->
  html = '
    <tr data-id="'+comment.id+'">
      <td>
        test
        <span class="actions">
          <a href="/author/posts/1/contents/2/comments/50226fa6a11460f4bb0009f8/delete" action="destroy" class="graylink">Delete</a>
        </span>
      </td>
      <td style="width: 150px">
        <span class="c-user">
          <i class="icon icon-user"></i>
          Гриша Еремин

        </span>
      </td>
      <td style="width: 150px">
        August 08, 2012 13:54
      </td>
      <td style="width: 100px">
        <span class="small cursive green">Approved</span>
      </td>
      <td style="width: 250px">
        <div class="btn-actions">
          <a href="/author/posts/1/contents/2/comments/50226fa6a11460f4bb0009f8/approve"><button class="btn btn-success btn-small">
            <i class="icon-white icon-thumbs-up"></i>
            Approve
          </button>
          </a>
          <a href="/author/posts/1/contents/2/comments/50226fa6a11460f4bb0009f8/reject"><button class="btn btn-small">
            <i class="icon-thumbs-down"></i>
            Reject
          </button>
          </a>
          <a href="/author/posts/1/contents/2/comments/50226fa6a11460f4bb0009f8/junk"><button class="btn btn-danger btn-small junk" title="Junk">
            <i class="icon-minus-sign"></i>
          </button>
          </a>
        </div>
      </td>
    </tr>
  '
  $("#comments").append($(html))
  false
