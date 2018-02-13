using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using Chinook.Data.Entities;
using ChinookSystem.DAL;
using System.ComponentModel;
using Chinook.Data.DTOs;
using Chinook.Data.POCOs;
#endregion

namespace ChinookSystem.BLL
{
    [DataObject]
    public class PlaylistsController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ClientPlaylist> Playlists_ClientPlaylist (int trackcountlimit)
        {
            using (var context = new ChinookContext())
            {
                var result = from p in context.Playlists
                             where p.PlaylistTracks.Count() > trackcountlimit
                             select new ClientPlaylist
                             {
                                 playlist = p.Name,
                                 songs = (from pt in p.PlaylistTracks
                                          select new TracksAndGenre
                                          {
                                              songtitle = pt.Track.Name,
                                              songgenre = pt.Track.Genre.Name
                                          }).ToList()
                             };
                return result.ToList();
            }
        }
    }
}
