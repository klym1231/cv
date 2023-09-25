package hkmu.comps380f.dao;

import hkmu.comps380f.exception.AttachmentNotFound;
import hkmu.comps380f.exception.PhotoNotFound;
import hkmu.comps380f.models.Attachment;
import hkmu.comps380f.models.Photo;
import hkmu.comps380f.repositories.AttachmentRepository;
import hkmu.comps380f.repositories.PhotoRepository;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class PhotoService {
    @Resource
    private PhotoRepository pRepo;

    @Resource
    private AttachmentRepository aRepo;

    @Transactional
    public List<Photo> getPhotos() {
        return pRepo.findAll();
    }

    public List<Photo> getMyPhotos(String username){
        return pRepo.findAllbyUsername(username);
    }

    @Transactional
    public Photo getPhoto(long id)
            throws PhotoNotFound {
        Photo photo = pRepo.findById(id).orElse(null);
        if (photo == null) {
            throw new PhotoNotFound(id);
        }
        return photo;
    }

    @Transactional
    public Attachment getAttachment(long ticketId, UUID attachmentId)
            throws PhotoNotFound, AttachmentNotFound {
        Photo photo = pRepo.findById(ticketId).orElse(null);
        if (photo == null) {
            throw new PhotoNotFound(ticketId);
        }
        Attachment attachment = aRepo.findById(attachmentId).orElse(null);
        if (attachment == null) {
            throw new AttachmentNotFound(attachmentId);
        }
        return attachment;
    }

    @Transactional(rollbackFor = PhotoNotFound.class)
    public void delete(long id) throws PhotoNotFound {
        Photo deletedPhoto = pRepo.findById(id).orElse(null);
        if (deletedPhoto == null) {
            throw new PhotoNotFound(id);
        }
        pRepo.delete(deletedPhoto);
    }
    public void delete(String username) {
        List<Photo> deletedPhotos = pRepo.findAllbyUsername(username);
        for(Photo p: deletedPhotos){
            pRepo.delete(p);
        }

    }
    @Transactional(rollbackFor = AttachmentNotFound.class)
    public void deleteAttachment(long ticketId, UUID attachmentId)
            throws PhotoNotFound, AttachmentNotFound {
        Photo photo = pRepo.findById(ticketId).orElse(null);
        if (photo == null) {
            throw new PhotoNotFound(ticketId);
        }

                photo.deleteAttachment();
                pRepo.save(photo);
                return;


    }

    @Transactional
    public long createPhoto(String username, String description, MultipartFile filePart)
            throws IOException {
        Photo photo = new Photo();
        photo.setUsername(username);
        photo.setDescription(description);
        Date date = new Date();
        Timestamp ts = new Timestamp(date.getTime());

        photo.setDate(ts);

            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setPhoto(photo);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                photo.setAttachment(attachment);

        }
        Photo savedTicket = pRepo.save(photo);
        return savedTicket.getId();
    }

    @Transactional(rollbackFor = PhotoNotFound.class)
    public void updateTicket(long id, String description, List<MultipartFile> attachments)
            throws IOException, PhotoNotFound {
        Photo updatedPhoto = pRepo.findById(id).orElse(null);
        if (updatedPhoto == null) {
            throw new PhotoNotFound(id);
        }
        updatedPhoto.setDescription(description);

        for (MultipartFile filePart : attachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setPhoto(updatedPhoto);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                updatedPhoto.setAttachment(attachment);
            }
        }
        pRepo.save(updatedPhoto);
    }
}